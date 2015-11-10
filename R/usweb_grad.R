#' Various color ramps based on the US Web Design Standards
#'
#' @param pal_name Palette name
#'
#' @section Palette names:
#' \itemize{
#'   \item \code{primary}
#'   \item \code{primary_alt}
#'   \item \code{secondary}
#'   \item \code{gray}
#'   \item \code{gray_warm}
#'   \item \code{gold}
#'   \item \code{green}
#'   \item \code{cool_blue}
#' }
#' @export
usweb_grad <- function(grad_name) {
  if(grad_name=='primary') {
    colors <- usweb_pal.primary_pal(5)
  }
  if(grad_name=='primary_alt') {
    colors <- usweb_pal.primary_alt(4)
  }
  if(grad_name=='secondary') {
    colors <- usweb_pal.secondary(4)
  }
  if(grad_name=='gray') {
    colors <- usweb_pal.gray(5)
  }
  if(grad_name=='gray_warm') {
    colors <- usweb_pal.gray_warm(2)
  }
  if(grad_name=='gold') {
    colors <- usweb_pal.gold(4)
  }
  if(grad_name=='green') {
    colors <- usweb_pal.green(4)
  }
  if(grad_name=='cool_blue') {
    colors <- usweb_pal.cool_blue(4)
  }
  return(colors)
}
