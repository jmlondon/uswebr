#' HTML Vignette Output Based on the US Web Design Standards
#'
#' This function is a variation of \code{html_uswds}
#' formats to create HTML vignette from R Markdown. It is intended to generate
#' single HTML pages that are based on the US Web Design Standards and focussed
#' on package vignettes. Attempts have been made to reduce file size
#' while maintaining the style design principles outlined in the web design
#' standards.
#'
#' @param css Additional CSS file to be \strong{merged} in the document. It will
#'                       \strong{NOT} overwrite the CSS from the themes.
#' @param \dots Additional arguments passed to \code{\link[rmarkdown]{html_document}}.
#'
#' @return R Markdown output format to pass to \code{\link[rmarkdown]{render}}.
#' @author Josh M London
#' @examples
#' \dontrun{
#' doc = system.file("rmarkdown", "templates", "usweb",
#'                   "skeleton", "skeleton.Rmd", package = "uswebr")
#' rmarkdown::render(doc, html_uswds_vignette(), output_dir = tempdir())
#' }
#' @export
#'
#'
html_uswds_vignette <- function(highlight = NULL,
                        css = NULL,
                        keep_md = FALSE,
                        ...) {

  ## Directories for resources
  css_dir  <- system.file("resources", "uswds-1.6.9","css",       package = "uswebr")
  img_dir  <- system.file("resources", "uswds-1.6.9","img",       package = "uswebr")
  tmpl_dir <- system.file("rmarkdown", "templates","usweb", package = "uswebr")

  ## Obtain CSS files
  uswds_css <- file.path(css_dir, "uswds.min.nofont.css")
  pkg_css <- system.file("resources", "styles.css", package = "uswebr")

  ## Also template
  pkg_tmpl <- file.path(tmpl_dir, "vignette.html")

  ## Final CSS file
  ## We first save it to a temporary file, and then copy it to the appropriate
  ## directory in the pre_processor() hook
  final_css <- tempfile(fileext = ".css")
  file.copy(uswds_css, final_css)
  file.append(final_css, pkg_css)

  ## Merge user-supplied CSS file
  if (!is.null(css)) {
    file.append(final_css, css)
  }

  ## Hook function, invoked after document is knitted (so we know files_dir)
  ## and before Pandoc is called (so we can pass the `css` parameter)
  pre_processor <- function(metadata, input_file, runtime, knit_meta,
                            files_dir, output_dir) {
    if (!file.exists(files_dir))
      dir.create(files_dir)
    ## Copy CSS and resources to files_dir
    file.copy(img_dir,  files_dir, recursive = TRUE)
    file.copy(css_dir, files_dir, recursive = TRUE)
    doc_css <- file.path(files_dir, "css", "style.css")
    file.copy(final_css, doc_css, overwrite = TRUE)

    ## Paremeters passed to Pandoc
    c("--css", doc_css)
  }

  ## `self_contained` needs to be explicitly specified, otherwise it will be
  ## set to TRUE
  extra_args <- list(...)
  self_contained <- extra_args$self_contained
  clean_supporting <- if (!is.null(self_contained)) self_contained else TRUE

  res <- rmarkdown::output_format(
    knitr = NULL,
    pandoc = NULL,
    keep_md = keep_md,
    clean_supporting = clean_supporting,
    pre_processor = pre_processor,
    ## Here `css` is set to NULL, but
    ## it will be set in the pre_processor() hook
    base_format = bookdown::html_document2(
                                           css = NULL,
                                           theme = NULL,
                                           highlight = "pygments",
                                           fig_caption = TRUE,
                                           fig_retina = NULL,
                                           fig_width = 5,
                                           fig_height = 5,
                                           split_by = "none",
                                           ...)
  )

  ## this hack is brough over from the prettydoc package. html_document()
  ## disables certain features (including MathJax) when using a template file
  ## other than default. This is likely to avoid the incompatibility between
  ## templates and options. However, the uswds templates only add a classes and
  ## style, so it should be safe to override this restriction.
  pandoc_args <- res$pandoc$args
  pandoc_args[grep("^--template$", pandoc_args) + 1] <- pkg_tmpl
  res$pandoc$args <- pandoc_args
  res
}