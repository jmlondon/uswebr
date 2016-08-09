load_fonts <- function() {
  wd <- getwd()
  font_path <- system.file(
    "rmarkdown","templates","usweb","resources","uswds-0.11.0","fonts",
    package = "uswebr"
  )
  setwd(font_path)
  mer_reg = "merriweather-regular-webfont.ttf"
  if (!file.exists(mer_reg)) {
    setwd(wd)
    stop("merriweather font not found...")
  }
  mer_bold = "merriweather-bold-webfont.ttf"
  if (!file.exists(mer_bold)) {
    setwd(wd)
    stop("merriweather bold font not found...")
  }

  ssp_reg = "sourcesanspro-regular-webfont.ttf"
  if (!file.exists(ssp_reg)) {
    setwd(wd)
    stop("source sans pro font not found...")
  }

  sysfonts::font.add("Source Sans Pro", ssp_reg)
  sysfonts::font.add("Merriweather", regular = mer_reg,
                     bold = mer_bold)
  showtext::showtext.auto()
  setwd(wd)
}