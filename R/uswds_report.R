#' Output a USWDS scientific report (deprecated).
#'
#' A USWDS report is a version of html_document with support for scientific
#' reports and based on the US Web Design Standards. This is now deprecated.
#' Use uswebr::html_uswds() instead
#'
#'
#' @return a message about the function being deprecated
#' @export
uswds_report <- function(...) {
  message(
    "The uswds_report function is now deprecated. Please update code to use uswebr::html_uswds()."
  )
}
