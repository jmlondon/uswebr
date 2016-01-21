#' US Web Design Standards Color Palette (Discrete) and Scales
#'
#' An 7-color qualitative discrete palette based on the UW Web Design Standards
#' and the colorblind-safe palette proposed by Okabe and Ito
#'
#' @rdname usweb_colors
#' @references
#'
#' \url{http://jfly.iam.u-tokyo.ac.jp/color}
#' \url{https://playbook.cio.gov/designstandards/visual-style/#palette}
#'
#' @export
#' @inheritParams ggplot2::scale_colour_hue
#' @family colour
#' @examples
#' library("ggplot2")
#' library(scales)
#' show_col(usweb_pal()(7))
#' p <- ggplot(mtcars) + geom_point(aes(x = wt, y = mpg,
#'      colour=factor(gear))) + facet_wrap(~am)
#' p + theme_igray() + scale_colour_usweb()

#' @rdname usweb_colors
#' @export
usweb_main <- c(blue="#0072B2",
                 vermillion="#D55E00",
                 bluish_green="#009E73",
                 reddish_purple="#CC79A7",
                 orange="#E69F00",
                 sky_blue="#02BFE7",
                 gold_light="#FAD980")

#' @rdname usweb_colors
#' @export
usweb_pal <- function() {
  manual_pal(unname(usweb_main))
}

#' @rdname usweb_colors
#' @export
scale_colour_usweb <- function(...) {
  discrete_scale("colour", "usweb", usweb_pal(), ...)
}

#' @rdname usweb_colors
#' @export
scale_color_usweb <- scale_colour_usweb

#' @rdname usweb_colors
#' @export
scale_fill_usweb <- function(...) {
  discrete_scale("fill", "usweb", usweb_pal(), ...)
}