#' 余暇と職種のクロス表：表1_1
#'
#' このデータセット（クロス表）は、『対応分析入門』第１章でCA（対応分析）の事例として
#' 使われているものです。
#'
#' @name tbl1_1
#' @docType data
#' @usage data(tbl1_1)
#'
#' @format A table data with 10 rows and 6 cols:
#' \describe{
#'   \item{行 余暇の過ごし方種類：}{スポーツイベント,映画,ダンス/ディスコ,
#'   カフェ/レストラン,劇場,クラッシック・コンサート,ポップ・コンサート,
#'   絵画展,図書館,教会サービス}
#'   \item{列 職種}{現業, Low非現業, High非現業, 農民, 学生, 退職者}
#' }
#' @source 『対応分析入門』より抜粋
#'
#' \code{
#' path <- system.file("extdata", "part2-chap2-alt.pdf", package = "ACAI")
#' browseURL(path)
#' }
#'
#' @examples
#' # データの表示
#' tbl1_1
#'
#' # showtext で日本語対応
#' if (requireNamespace("showtext", quietly = TRUE)) {
#'   showtext::showtext_auto(TRUE)
#' }
#'
#' # vcd の mosaic() で可視化
#' if (requireNamespace("vcd", quietly = TRUE)) {
#'   vcd::mosaic(tbl1_1, shade = TRUE, legend = TRUE)
#' }
"tbl1_1"
