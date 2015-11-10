#' ggplot2 theme based
#'
#' A ggplot2 theme based on the US Web Design Standards
#'
#'
#' @return ggplot2 theme
#' @export
usweb_theme <- function() {
  sysfonts::font.add("Source Sans Pro",
           regular="Source Sans Pro regular.ttf",
           bold="Source Sans Pro 600.ttf",
           italic="Source Sans Pro italic.ttf"
  )
  showtext::showtext.auto()

  color.background = "#efefef"
  color.grid.major = "#d6d7d9"
  color.axis.text = "#5b616b"
  color.axis.title = "#323a45"
  color.title = "#212121"

  # Begin construction of chart
  theme_bw(base_size=9) +

    # Set the base font family to Source Sans Pro
    theme(
      text=element_text(family="Source Sans Pro"),

    # Set the entire chart region to a light gray color
      panel.background=element_rect(fill=color.background, color=color.background),
      plot.background=element_rect(fill=color.background, color=color.background),
      panel.border=element_rect(color=color.background),

    # Format the grid
      panel.grid.major=element_line(color=color.grid.major,size=.25),
      panel.grid.minor=element_blank(),
      axis.ticks=element_blank(),

    # Format the legend, but hide by default
      legend.position="none",
      legend.background = element_rect(fill=color.background),
      legend.text = element_text(size=7,color=color.axis.title),

    # Set title and axis labels, and format these and tick marks
      plot.title=element_text(color=color.title,
                                  size=16, vjust=1.5,lineheight=0.9,
                                  face="bold"),
      axis.text.x=element_text(size=10,color=color.axis.text),
      axis.text.y=element_text(size=10,color=color.axis.text),
      axis.title.x=element_text(size=12,color=color.axis.title, vjust=0),
      axis.title.y=element_text(size=12,color=color.axis.title, vjust=1.25),

    # Plot margins
    plot.margin = grid::unit(c(0.5, 0.35, 0.45, 0.5), "cm")
    )
}
