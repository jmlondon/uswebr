#' HTML Output Based on the US Web Design Standards
#'
#' This function is an alternative to the \code{\link[rmarkdown]{html_document}}
#' formats to create HTML document from R Markdown. It is intended to generate
#' single HTML pages that are based on the US Web Design Standards and primarily
#' scientific content. Attempts have been made to mirror a scientific journal
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
#' rmarkdown::render(doc, html_uswds(), output_dir = tempdir())
#' }
#' @export
#'
#'
html_uswds <- function( highlight = NULL,
                        css = NULL,
                        keep_md = FALSE,
                        readme = FALSE,
                        ...) {

  ## Directories for resources
  css_dir  <- system.file("resources", "uswds-1.3.1","css",       package = "uswebr")
  font_dir <- system.file("resources", "uswds-1.3.1","fonts",     package = "uswebr")
  img_dir  <- system.file("resources", "uswds-1.3.1","img",       package = "uswebr")
  js_dir   <- system.file("resources", "uswds-1.3.1","js",        package = "uswebr")
  tmpl_dir <- system.file("rmarkdown", "templates","usweb", package = "uswebr")

  ## Obtain CSS files
  uswds_css <- file.path(css_dir, "uswds.min.css")
  pkg_css <- system.file("resources", "styles.css",       package = "uswebr")

  ## Also template
  pkg_tmpl <- file.path(tmpl_dir, "template.html")

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

  ## Borrowed from html_vignette()
  pre_knit <- function(input, ...) {
    if (readme) {
      rmarkdown::render(input,
                        output_format = "github_document",
                        output_options = list(html_preview = FALSE),
                        output_file = "README.md",
                        output_dir = dirname(dirname(input)),
                        quiet = TRUE)
    }
  }

  ## Hook function, invoked after document is knitted (so we know files_dir)
  ## and before Pandoc is called (so we can pass the `css` parameter)
  pre_processor <- function(metadata, input_file, runtime, knit_meta,
                            files_dir, output_dir) {
    if (!file.exists(files_dir))
      dir.create(files_dir)
    ## Copy CSS and resources to files_dir
    file.copy(font_dir, files_dir, recursive = TRUE)
    file.copy(img_dir,  files_dir, recursive = TRUE)
    file.copy(css_dir, files_dir, recursive = TRUE)
    file.copy(js_dir, files_dir, recursive = TRUE)
    doc_css <- file.path(files_dir, "css", "style.css")
    file.copy(final_css, doc_css, overwrite = TRUE)
    doc_js <- file.path(files_dir, "js", "uswds.min.js")
    output = paste('<script language="JavaScript" src="',
                   doc_js,
                   '"></script>\n',
                   sep = "")

    outfile = file.path(tempdir(), 'usweb_includes.html')
    cat(output, file = outfile)
    ## Paremeters passed to Pandoc
    c("--css", doc_css, "--include-in-header", outfile)
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
    pre_knit = pre_knit,
    pre_processor = pre_processor,
    ## Here `css` is set to NULL, but
    ## it will be set in the pre_processor() hook
    base_format = rmarkdown::html_document(
                                           css = NULL,
                                           theme = NULL,
                                           highlight = "pygments",
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