<!-- README.md is generated from README.Rmd. Please edit that file -->
uswebr
======

An R package that includes an RMarkdown template, ggplot2 theme, and ggplot2 color palette/scales. The RMarkdown template is specifically customized for NOAA Fisheries, Alaska Fisheries Science Center and targeted for scientific reports and documentation. The look and feel is based on the [US Digital Web Standards](https://playbook.cio.gov/designstandards/) developed by the [US Digital Service](https://www.whitehouse.gov/digital/united-states-digital-service) and [18F](https://18f.gsa.gov/).

The ggplot2 theme is inspired by the fivethirtyeight theme in the ggthemes package as well as the US Digital Web Standards.

The color palette/scales are inspired by the US Digital Web Standards and the colorblind safe palette proposed by Okabe and Ito

Install
-------

To install the development version from github, use the **devtools** package,

``` r
library("devtools")
install_github("jmlondon/uswebr")
```

Example yaml header for RMarkdown
---------------------------------

    ---
    title: "Report Title"
    subtitle: "report subtitle"
    draft: true
    author:
    - name: First A. Author
      affiliation: 1
    - name: Second A. Author
      affiliation: 2
    address:
    - code: 1
      address: Division, Agency, City, State, Country 
      email: first.author@noaa.gov
      orcid: orcid.org/0000-0000-0000-0000
    - code: 2
      address: Division, Agency, City, State, Country 
      email: second.author@noaa.gov
    date: "21 January, 2016"
    disclaimer: >
      The scientific results and conclusions, as well as any views or opinions 
      expressed herein, are those of the author(s) and do not necessarily reflect 
      those of NOAA or the Department of Commerce.
    abstract: >
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nunc enim, accumsan vel ante a, faucibus convallis lorem. Quisque sit amet tellus molestie, eleifend justo eu, dapibus diam. Suspendisse suscipit neque id sapien semper fermentum ac nec dui. Maecenas porttitor ligula ligula, a laoreet ex congue sed. Mauris in egestas elit. Curabitur ut tellus vel lacus maximus elementum. Cras et bibendum libero, nec pellentesque risus. Integer suscipit sodales nulla, ullamcorper faucibus erat aliquet et. Donec condimentum nisl at enim gravida consectetur. Sed luctus eleifend lorem, quis tempor nisi lacinia at. Quisque sodales semper orci, eu aliquam enim sagittis eget.
    output:
      html_document:
        uswebr::noaa_report
    ---

Example ggplot theme and palette/scales
---------------------------------------

### Color Palette

``` r
library(ggplot2)
library(scales)
library(uswebr)
show_col(usweb_pal()(7))
```

![](README_files/figure-markdown_github/unnamed-chunk-1-1.png)
 \#\#\# ggplot examples

``` r
p <- ggplot(mpg, aes(class))
p + geom_bar(aes(fill=drv))
```

![](README_files/figure-markdown_github/unnamed-chunk-2-1.png)

``` r
p + geom_bar(aes(fill=drv)) + usweb_theme() + scale_fill_usweb()
```

![](README_files/figure-markdown_github/unnamed-chunk-2-2.png)

``` r
p <- ggplot(diamonds, aes(clarity, fill=cut))
p + geom_bar()
```

![](README_files/figure-markdown_github/unnamed-chunk-2-3.png)

``` r
p + geom_bar() + usweb_theme() + scale_fill_usweb()
```

![](README_files/figure-markdown_github/unnamed-chunk-2-4.png)
