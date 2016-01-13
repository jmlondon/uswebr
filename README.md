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
    title: "My Scientific Report"
    subtitle: "AFSC science is awesome"
    draft: true
    author:
    - name: First Author
      affiliation: 1
    - name: Second Author
      affiliation: 2
    address:
    - code: 1
      address: Alaska Fisheries Science Center, NOAA Fisheries, Seattle, Washington, USA 
      email: first.author@noaa.gov
      orcid: orcid.org/0000-1111-2222-3333
    - code: 2
      address: Alaska Fisheries Science Center, NOAA Fisheries, Seattle, Washington, USA 
      email: second.author@noaa.gov
      orcid: orcid.org/4444-5555-6666-7777
    date: "13 January, 2016"
    disclaimer: >
      The scientific results and conclusions, as well as any views or opinions 
      expressed herein, are those of the author(s) and do not necessarily reflect 
      those of NOAA or the Department of Commerce.
    agency-footer: true
    abstract: >
      Morbi ipsum velit, sodales sed lectus vitae, pellentesque ultricies nibh. Nullam egestas tempor eros, ut rhoncus diam tincidunt et. Aliquam erat volutpat. Pellentesque consectetur turpis ut purus volutpat facilisis. Cras pharetra, nibh vel ornare pulvinar, justo enim varius felis, ac efficitur mi est pharetra lacus. Phasellus lobortis facilisis augue et tincidunt. Donec sapien dui, elementum nec magna vel, convallis congue metus. Nulla sollicitudin, enim vel euismod venenatis, dolor eros convallis lacus, at aliquam sem magna a ante. Cras rhoncus lacus ac posuere vehicula. Curabitur bibendum, elit a congue lobortis, justo diam fermentum nunc, tempor egestas felis nisl a lectus. Sed elementum est nunc, nec tincidunt nisl pharetra et. Ut libero enim, aliquet vel metus sit amet, pharetra volutpat justo. Praesent id metus a nisl condimentum feugiat.
    output:
      html_document:
        uswebr::noaa_report
    ---
