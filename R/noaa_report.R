#' Output a NOAA report.
#'
#' A NOAA report is a version of html_document with support for NOAA
#' colors, logos and based on the US Web Design Standards
#'
#'
#' @return R Markdown output format to pass to \code{\link{render}}
#' @export
noaa_report <- function(toc = FALSE,
                        css = NULL,
                        fig_width = 8,
                        ...) {

  create_header = function() {
    js = system.file(
      "rmarkdown",
      "templates",
      "usweb",
      "resources",
      "designstandards",
      "js",
      "components.js",
      package = "uswebr"
    )
    jquery = system.file(
      "rmarkdown",
      "templates",
      "usweb",
      "resources",
      "designstandards",
      "js",
      "vendor",
      "jquery-1.11.3.min.js",
      package = "uswebr"
    )

    output = paste(
      '<script language="JavaScript" src="',
      jquery,
      '"></script>\n',
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
          "designstandards",
          "css",
          "main.css",
          package = "uswebr"
        ),
        system.file(
          "rmarkdown",
          "templates",
          "usweb" ,
          "resources",
          "designstandards",
          "css",
          "google-fonts.css",
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

  rmarkdown::html_document(
    toc = toc,
    theme = NULL,
    css = css,
    keep_md = TRUE,
    fig_width = fig_width,
    self_contained = TRUE,
    template = system.file("rmarkdown", "templates", "usweb", 'template.html',
                           package = 'uswebr'),
    includes = rmarkdown::includes(in_header = create_header()),
    pandoc_args = c(
      "--variable=mathjax-url",
      paste0("--variable=agency-logo:", agency_logo_path)
    ),
    ...
  )
}
