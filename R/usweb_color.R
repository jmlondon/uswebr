#' Return color value (hex) for a color described in the US Web Design Standards
#'
#' @param color_name Color name
#'
usweb_color <- function(color_name) {
  usweb_color[[color_name]]
}
