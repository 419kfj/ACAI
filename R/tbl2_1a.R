#' 犯罪のクロス表：表2_1a
#'
#' このデータセット（クロス表）は、『対応分析入門』第１章でCA（対応分析）の事例として
#' 使われているものです。
#'

#' @name tbl2_1a
#' @docType data
#' @usage data(tbl2_1a)
#'
#' @format A table data with 10 rows and 6 cols:
#' \describe{
#'   \item{行 地域：}{オスロ,中部地域,北部地域,合計,全国}
#'   \item{列 犯罪}{強盗,詐欺.破壊,合計.密,疎}
#' }
#' @source 『対応分析入門』第２章より抜粋
#' @examples
#' # データの表示
#' tbl2_1a
#' # showtext で日本語対応
#' if (requireNamespace("showtext", quietly = TRUE)) {
#'   showtext::showtext_auto(TRUE)
#' }
#'
#' # vcd の mosaic() で可視化
#' if (requireNamespace("vcd", quietly = TRUE)) {
#'   vcd::mosaic(tbl2_1a, shade = TRUE, legend = TRUE)
#' }
"tbl2_1a"
