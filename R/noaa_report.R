#' Output a NOAA report.
#'
#' A NOAA report is a version of html_document with support for NOAA
#' colors, logos and based on the US Web Design Standards
#'
#'
#' @return R Markdown output format to pass to \code{\link{render}}
#' @export
noaa_report <- function(toc = FALSE) {
  # call the base html_document function
  base_path <- 'rmarkdown/templates/usweb'
  agency_logo_path <- system.file(paste(base_path,'skeleton',
                                        'assets/logo/noaa-fisheries-rgb-stacked.png',
                                        sep='/'),package='uswebr')
  rmarkdown::html_document(
    toc = toc,
    fig_width = 8,
    theme = NULL,
    keep_md = TRUE,
    self_contained = TRUE,
    template = system.file(paste(base_path,'template.html',sep='/'),
                           package = 'uswebr'),
    includes = rmarkdown::includes(in_header = uswebr::create_header()),
    pandoc_args = c("--variable=mathjax-url",
                    paste0("--variable=agency-logo:",agency_logo_path))
  )
}
