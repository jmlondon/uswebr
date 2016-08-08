load_fonts <- function() {
  sysfonts::font.paths(system.file("rmarkdown",
                         "templates",
                         "usweb",
                         "resources",
                         "uswds-0.10.0",
                         "fonts",
                         package = 'uswebr'))
  sysfonts::font.add("Source Sans Pro",
           regular = "sourcesanspro-regular-webfont.ttf")
  sysfonts::font.add("Merriweather",
           regular = "merriweather-regular-webfont.ttf")
  invisible()
}