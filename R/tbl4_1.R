#' 生活保護受給者データから作成した多重回答表（積み重ね表）：表4_!
#'
#' このデータセット（積み重ね表）は、『対応分析入門』第4章でCA（対応分析）の事例として
#' 使われているものです。
#'
#' @name tbl4_1
#' @docType data
#' @usage data(tbl4_1)
#'
#' @format A table data with 32 rows and 4 cols､ :
#' \describe{
#'   \item{行：}{
#'    "精神疾患","不健康","鎮痛剤使用","年金（病人、失業者向け）",
#'    "低学歴","飲酒","受刑者","飲酒に問題",
#'    "麻薬常用","罰金負債","日常的喫煙","長期患者"
#'    "日常支出に問題","NOK2000問題","失業","住宅ローン",
#'    "持ち家","自家用車所持","高収入","男性",
#'    "女性","18〜24歳","25〜30歳","30〜50歳",
#'    "未婚","既婚","離婚","地方",
#'    "都会","都市","子供なし世帯","子供あり世帯",}
#'   \item{列: }{"病気","逸脱者","中毒者","負債者"}
#'   }
#' @source 『対応分析入門』より抜粋
#' @examples
#' # データの表示
#' tbl4_1
#'
#' # showtext で日本語対応
#' if (requireNamespace("showtext", quietly = TRUE)) {
#'   showtext::showtext_auto(TRUE)
#' }
#'
#' # vcd の mosaic() で可視化
#' if (requireNamespace("vcd", quietly = TRUE)) {
#'   vcd::mosaic(tbl4_1,shade=TRUE,
#'              rot_labels = c(left = 0, top = 0, right = 0))
#' }
"tbl4_1"
