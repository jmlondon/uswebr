#' Output a USWDS styled vignette
#'
#' A USWDS styled vignette is a lightweight version of html_document with based on
#' the US Web Design Standards
#'
#'
#' @return R Markdown output format to pass to \code{\link{render}}
#' @export
uswds_report <- function(toc = FALSE,
                         css = NULL,
                         fig_width = 6,
                         ...) {
  uswebr:::load_fonts()
  ggplot2::theme_set(ggplot2::theme_grey(
    base_family = "Source Sans Pro") +
      ggplot2::theme(plot.title =
                       ggplot2::element_text(
                         family = "Merriweather")))

  template = system.file("rmarkdown",
                         "templates",
                         "usweb",
                         "vignette.html",
                         package = 'uswebr')

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

  base_format <- rmarkdown::html_document(
    toc = toc,
    theme = NULL,
    css = css,
    keep_md = FALSE,
    fig_width = fig_width,
    self_contained = TRUE,
    ...
  )

  template_arg <-
    which(base_format$pandoc$args == "--template") + 1L
  base_format$pandoc$args[template_arg] <- template

  base_format
}
