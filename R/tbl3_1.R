#' 年齢グループごと疾病群：表3_1
#'
#' このデータセット（クロス表）は、『対応分析入門』第３章でCA（対応分析）の事例として
#' 使われているものです。
#'
#' @name tbl3_1
#' @docType data
#' @usage data(tbl3_1)
#'
#' @format A table data with 12 rows and 6 cols:
#' \describe{
#'   \item{行 疾病群：}{"精神障害","神経系","耳鼻科","循環器系","呼吸器系","胃潰瘍",
#'           "他の消化器系疾患","泌尿器/生殖器","上皮皮下組織","筋骨格疾患","他の疾患","怪我"}
#'   \item{列 年齢グループ}{"A0.6", "A7.15", "A16.24", "A25.44", "A45.66", "A67." }
#'   }
#' @source 『対応分析入門』より抜粋
#' @examples
#' # データの表示
#' tbl3_1
#'
#' # showtext で日本語対応
#' if (requireNamespace("showtext", quietly = TRUE)) {
#'   showtext::showtext_auto(TRUE)
#' }
#'
#' # vcd の mosaic() で可視化
#' if (requireNamespace("vcd", quietly = TRUE)) {
#'   vcd::mosaic(tbl3_1, shade = TRUE, legend = TRUE)
#' }
"tbl3_1"
