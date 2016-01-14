<!-- README.md is generated from README.Rmd. Please edit that file -->
uswebr
======

An R package that includes an RMarkdown template and a ggplot2 theme. The template is specifically customized for NOAA Fisheries, Alaska Fisheries Science Center and targeted for scientific reports and documentation. The look and feel is based on the [US Digital Web Standards](https://playbook.cio.gov/designstandards/) developed by the [US Digital Service](https://www.whitehouse.gov/digital/united-states-digital-service) and [18F](https://18f.gsa.gov/).

Install
-------

To install the development version from github, use the **devtools** package,

``` r
library("devtools")
install_github("jmlondon/uswebr")
```

Example yaml header
-------------------

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
    date: "13 January, 2016"
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
