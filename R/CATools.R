#' -------------------------------------------------
#' CA tools
#'
#' 対応分析に関係する小道具集
#'
#' 前提としているCAは、package FactoMineR のCA
#' 2015−10−23
#' kazuo.fujimoto2007@gmail.com
# -------------------------------------------------

#'
#' 重心-プロファイルポイント間距離
#' .tbl 度数（クロス）表
#'
#'@export
get_point_dist <- function(.tbl){
  ## プロファイル行列を求める
  rowsize <- dim(.tbl)[1]# 行数
  colsize <- dim(.tbl)[2]# 列数
  n <- sum(.tbl) # 総数n
  R <- apply(.tbl,1,sum)#行和
  Rn <- c(R,n)
  C <- apply(.tbl,2,sum)#列和
  Cn <- c(C,n)
  .tbl.f <- rbind(cbind(.tbl,R),Cn)# 行周辺度数を含めた行列
  .tbl.rpro <- diag(1/Rn) %*% .tbl.f[,1:colsize]
  rownames(.tbl.rpro) <- c(rownames(.tbl),"Ave")

  ## 重心と行プロファルの間の距離を求める
  .tbl.r <- .tbl.rpro[1:rowsize,]
  dist.r <- sqrt(apply((t(.tbl.rpro[1:rowsize,]) - .tbl.rpro[rowsize+1,])^2 /
                         .tbl.rpro[rowsize+1,],2,sum))
  return(dist.r)
}


#
# ポイント間距離を求める
# .tbl 度数（クロス）表
#
#'@export
get_interpoints_dist <- function(.tbl){
  rowsize <- dim(.tbl)[1]# 行数
  colsize <- dim(.tbl)[2]# 列数
  n <- sum(.tbl) # 総数n
  R <- apply(.tbl,1,sum)#行和
  Rn <- c(R,n)
  C <- apply(.tbl,2,sum)#列和
  Cn <- c(C,n)
  .tbl.f <- rbind(cbind(.tbl,R),Cn)# 行周辺度数を含めた行列
  .tbl.rpro <- diag(1/Rn) %*% .tbl.f[,1:colsize]
  rownames(.tbl.rpro) <- c(rownames(.tbl),"Ave")

  Drm12 <- diag(1/sqrt(.tbl.rpro[rowsize+1,1:colsize]))# 平均行プロファイルのルート分の１で、
  .tbl.st <- .tbl.rpro[1:rowsize,1:colsize] %*% Drm12 # プロファイル行列をストレッチ（大隅2015、Greenacre2007）
  return(dist(.tbl.st)) # ストレッチ行列のユークリッド距離は、χ二乗距離になっている。
}

#
# 質量を求めます
# .tbl 度数（クロス）表
#
#'@export
get_row_mass <- function(.tbl){
  ## プロファイル行列を求める
  rowsize <- dim(.tbl)[1]# 行数
  colsize <- dim(.tbl)[2]# 列数
  n <- sum(.tbl) # 総数n
  R <- apply(.tbl,1,sum)#行和
  Rn <- c(R,n)
  C <- apply(.tbl,2,sum)#列和
  Cn <- c(C,n)
  .tbl.f <- rbind(cbind(.tbl,R),Cn)# 行周辺度数を含めた行列
  return(.tbl.f[1:rowsize,colsize+1]/n)
}


#
# CAの出力する固有値情報をもとに、スクリープロットを描く。
#
# FactoMineR
#'@export
draw_screeplot <- function(res.CA){
  library(qcc)
  knitr::kable(res.CA$eig)
  drange <- dim(res.CA$eig)[1]
  dnames <- paste("Dim",1:drange,sep="")
  pareto.chart(res.CA$eig[,1],names=dnames,
               main="Screeplot",las=1,xlab="座標軸",
               ylab="固有値",ylab2="積％",
               col="lightblue")
}

#
# 絶対的寄与（CONTR）を図示する
#
# FactoMineR のレザルトを入力
#'@export
disp_contr <- function(res.CA){
  library(lattice)# Trellis Graphics を使うために Lattice をロード
  library(reshape2)

  .data <- res.CA$row$contrib[nrow(res.CA$row$contrib):1,1:3]#行を逆順、Dim1-3
  .dd.t <- melt(.data)#
  fig1 <- barchart(Var1~value|Var2,data=.dd.t,
           layout=c(3,1),
           main="各軸に対する行ポイントの寄与",
           xlab="寄与率")

  .data <- res.CA$col$contrib[nrow(res.CA$col$contrib):1,1:3]#行を逆順、Dim1-3
  .dd.t <- melt(.data)#
  fig2 <- barchart(Var1~value|Var2,data=.dd.t,
           layout=c(3,1),
           main="各軸に対する列ポイントの寄与",
           xlab="寄与率")
  print(fig1)
  print("")
  print(fig2)
}

#
# 平方相関、相対的寄与率の図示する
#
# FactoMiner のレザルトを投入
#'@export
disp_corr2 <- function(res.CA){
  .data <- res.CA$row$cos2[nrow(res.CA$row$cos2):1,3:1]
  .dd.t <- melt(.data)#
  fig1 <- barchart(Var2~value|Var1,data=.dd.t,
           #layout=c(3,10),
           main="行ポイントへの各軸(Dim1-3)の寄与",
           xlab="寄与率")

  .data <- res.CA$col$cos2[nrow(res.CA$col$cos2):1,3:1]
  .dd.t <- melt(.data)#
  fig2 <- barchart(Var2~value|Var1,data=.dd.t,
           #layout=c(3,10),
           main="列ポイントへの各軸(Dim1-3)の寄与",
           xlab="寄与率")
  print(fig1)
  print("")
  print(fig2)
}

#
# 平方相関の累積割合（品質）を確認する
#
# FactoMineR のレザルトを投入
#'@export
qty_cos2 <- function(res.CA){
  .data <- apply(res.CA$row$cos2,1,cumsum)
  .dd.t <- melt(.data)
  fig1 <- xyplot(value ~ Var1|Var2,data=.dd.t,type="b",
            main="各軸の行pointへの累積寄与",
            xlab="質")

  .data <- apply(res.CA$col$cos2,1,cumsum)
  .dd.t <- melt(.data)
  fig2 <- xyplot(value ~ Var1|Var2,data=.dd.t,type="b",
            main="各軸の列pointへの累積寄与",
            xlab="質")
  print(fig1)
  print("")
  print(fig2)
}

### `r as.character(Sys.time())`
