#' 飲酒頻度ｘ年齢ｘ性別の多元クロス表：表5_1a
#'
#' このデータセット（積み重ね表）は、『対応分析入門』第5章でCA（対応分析）の事例として
#' 使われているものです。
#'
#' @name tbl5_1a
#' @docType data
#' @usage data(tbl5_1a)
#'
#' @format A table data with 32 rows and 4 cols､ :
#' \describe{
#'   \item{dim1:飲酒頻度}{ "M23","MS","MTW","never","OM","OW"}
#'   \item{dim2: 年齢}{"A16.25","A26.35","A36.45","A46.55","A56.66","A67.100"}
#'   \item{dim3: 性別 }
#'   }
#' @source 『対応分析入門』より抜粋
#' @examples
#' # データの表示
#' tbl5_1a
#'
#' # showtext で日本語対応
#' if (requireNamespace("showtext", quietly = TRUE)) {
#'   showtext::showtext_auto(TRUE)
#' }
#'
#' # vcd の mosaic() で可視化
#' if (requireNamespace("vcd", quietly = TRUE)) {
#'   vcd::mosaic(tbl5_1a,shade=TRUE,
#'              rot_labels = c(left = 0, top = 0, right = 0))
#'   vcd::mosaic(ALC ~ AGE,tbl5_1a)
#'   vcd::mosaic(ALC ~ AGE | SEX,tbl5_1a)

#'
#' }
"tbl5_1a"
