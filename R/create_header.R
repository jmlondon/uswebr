
#' Create custom HTML header for css and js file paths
#'
#' @export
create_header = function() {

  js = system.file(package="uswebr",
                           'rmarkdown/templates/usweb/skeleton/assets/js/components.js')
  jquery = system.file(package="uswebr",
                   'rmarkdown/templates/usweb/skeleton/assets/js/vendor/jquery-1.11.3.min.js')
  css = system.file(package="uswebr",
                     'rmarkdown/templates/usweb/skeleton/assets/css/styles.css')
  css1 = system.file(package="uswebr",
                     'rmarkdown/templates/usweb/skeleton/assets/css/main.css')
  css2 = system.file(package="uswebr",
                     'rmarkdown/templates/usweb/skeleton/assets/css/google-fonts.css')

  output = paste(
    '<link rel="stylesheet" href="',css2,'">\n',
    '<link rel="stylesheet" href="',css1,'">\n',
    '<link rel="stylesheet" href="',css,'">\n',
    '<script language="JavaScript" src="',jquery,'"></script>\n',
    '<script language="JavaScript" src="',js,'"></script>\n',
    sep="")

  outfile = paste(tempdir(), 'usweb_includes.html', sep='/')
  cat(output, file=outfile)
  invisible(outfile)
}