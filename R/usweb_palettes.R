#' Various color palettes based on the US Web Design Standards
#'
#' @param n number of colors
usweb_pal <- function(n) UseMethod("usweb_pal")

#' @describeIn usweb_pal Main color palette (categorical, 5 colors)
usweb_pal.main <- function(n=5) {
  colors <- usweb_colors[c('secondary','cool_blue','green','gold','visited')]
unname(colors[seq_len(n)])
}

#' @describeIn usweb_pal Primary color palette (gradient, 4 colors)
usweb_pal.primary <- function(n=4) {
  colors <- usweb_colors[c('gray_cool_light','primary','primary-darker','primary_darkest','base')]
  unname(colors[seq_len(n)])
}

#' @describeIn usweb_pal Alternate primary color palette (gradient, 4 colors)
usweb_pal.primary_alt <- function(n=4) {
  colors <- usweb_colors[c('primary_alt_lightest','primary_alt_light','primary_alt_dark','primary_alt_darkest')]
  unname(colors[seq_len(n)])
}

#' @describeIn usweb_pal Secondary color palette (gradient, 4 colors)
usweb_pal.secondary <- function(n=4) {
  colors <- usweb_colors[c('secondary_lightest','secondary_light','secondary_dark','secondary_darkest')]
  unname(colors[seq_len(n)])
}

#' @describeIn usweb_pal Gray color palette (gradient, 5 colors)
usweb_pal.gray <- function(n=5) {
  colors <- usweb_colors[c('gray_lightest','gray_lighter','gray_light','gray','gray_dark')]
  unname(colors[seq_len(n)])
}

#' @describeIn usweb_pal Warm gray color palette (gradient, 2 colors)
usweb_pal.gray_warm <- function(n=2) {
  colors <- usweb_colors[c('gray_warm_light','gray_warm_dark')]
  unname(colors[seq_len(n)])
}

#' @describeIn usweb_pal Gold color palette (gradient, 4 colors)
usweb_pal.gold <- function(n=4) {
  colors <- usweb_colors[c('gold_lightest','gold_lighter','gold_light','gold')]
  unname(colors[seq_len(n)])
}

#' @describeIn usweb_pal Green color palette (gradient, 4 colors)
usweb_pal.green <- function(n=4) {
  colors <- usweb_colors[c('green_lightest','green_lighter','green_light','green')]
  unname(colors[seq_len(n)])
}

#' @describeIn usweb_pal Cool blue color palette (gradient, 4 colors)
usweb_pal.cool_blue <- function(n=4) {
  colors <- usweb_colors[c('cool_blue_lightest','cool_blue_lighter','cool_blue_light','cool_blue')]
  unname(colors[seq_len(n)])
}
