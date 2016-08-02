#' Output a USWDS scientific report.
#'
#' A USWDS report is a version of html_document with support for scientific
#' reports and based on the US Web Design Standards
#'
#'
#' @return R Markdown output format to pass to \code{\link{render}}
#' @export
uswds_report <- function(toc = FALSE,
                        css = NULL,
                        fig_width = 8,
                        ...) {
  template = system.file("rmarkdown", "templates", "usweb", 'template.html',
                         package = 'uswebr')

  create_header = function() {
    js = system.file(
      "rmarkdown",
      "templates",
      "usweb",
      "resources",
      "uswds-0.10.0",
      "js",
      "uswds.min.js",
      package = "uswebr"
    )
    output = paste(
      '<script language="JavaScript" src="',
      js,
      '"></script>\n',
      sep = ""
    )

    outfile = paste(tempdir(), 'usweb_includes.html', sep = '/')
    cat(output, file = outfile)
    invisible(outfile)
  }

  if (is.null(css)) {
    css <-
      c(
        system.file(
          "rmarkdown",
          "templates",
          "usweb" ,
          "resources",
          "uswds-0.10.0",
          "css",
          "uswds.min.css",
          package = "uswebr"
        ),
        system.file(
          "rmarkdown",
          "templates",
          "usweb" ,
          "resources",
          "styles.css",
          package = "uswebr"
        )
      )
  }

  agency_logo_path <-
    system.file(
      "rmarkdown",
      "templates",
      "usweb",
      "resources",
      "noaa-fisheries-rgb-stacked.png",
      package = 'uswebr'
    )

  base_format <- rmarkdown::html_document(
    toc = toc,
    theme = NULL,
    css = css,
    keep_md = TRUE,
    fig_width = fig_width,
    self_contained = TRUE,
    includes = rmarkdown::includes(in_header = create_header()),
    pandoc_args = c(
      paste0("--variable=agency-logo:", agency_logo_path)
    ),
    ...
  )

  template_arg <- which(base_format$pandoc$args == "--template") + 1L
  base_format$pandoc$args[template_arg] <- template

  base_format
}