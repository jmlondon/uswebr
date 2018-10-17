<!-- README.md is generated from README.Rmd. Please edit that file -->
uswebr
======

An R package that includes an RMarkdown template targeted for scientific
reports and documentation using the `bookdown` package’s
`html_document2()` function. The look and feel is based on the [US
Digital Web Standards](https://standards.usa.gov/).

An important component of the US Web Design standards is accessibility.
All of the designs meet the WCAG 2.0 AA accessibility guidelines and are
compliant with Section 508 of the Rehabilitation Act. Some stylistic
changes have been made to bring the look and feel more inline with
scientific reports and manuscripts. Some of these changes may bring the
produced reports, technically, out of 508 compliance. Plots and other
elements added by the user should continue to follow accessiblity
guidelines when possible.

Install
-------

To install the development version from github, use the **devtools**
package,

``` r
library("devtools")
install_github("jmlondon/uswebr")
```

Example YAML header for RMarkdown
---------------------------------

The report expands support for additional fields in the YAML header.
Notably, multiple authors and affiliations can be provided. The user can
also provide text for an abstract that will be inserted into the output
document before the first content section. The user can also set
`draft: true` and a warning about the report being in draft form and not
citable will be added to the top of the document.

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
    date: "17 October, 2018"
    abstract: >
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nunc enim, accumsan vel ante a, faucibus convallis lorem. Quisque sit amet tellus molestie, eleifend justo eu, dapibus diam. Suspendisse suscipit neque id sapien semper fermentum ac nec dui. Maecenas porttitor ligula ligula, a laoreet ex congue sed. Mauris in egestas elit. Curabitur ut tellus vel lacus maximus elementum. Cras et bibendum libero, nec pellentesque risus. Integer suscipit sodales nulla, ullamcorper faucibus erat aliquet et. Donec condimentum nisl at enim gravida consectetur. Sed luctus eleifend lorem, quis tempor nisi lacinia at. Quisque sodales semper orci, eu aliquam enim sagittis eget.
    output: 
      uswebr::html_uswds:
        number_sections: FALSE
    ---

------------------------------------------------------------------------

\#\#\#\#\#Disclaimer

<sub>This repository is a scientific product and is not official
communication of the National Oceanic and Atmospheric Administration, or
the United States Department of Commerce. All NOAA GitHub project code
is provided on an ‘as is’ basis and the user assumes responsibility for
its use. Any claims against the Department of Commerce or Department of
Commerce bureaus stemming from the use of this GitHub project will be
governed by all applicable Federal law. Any reference to specific
commercial products, processes, or services by service mark, trademark,
manufacturer, or otherwise, does not constitute or imply their
endorsement, recommendation or favoring by the Department of Commerce.
The Department of Commerce seal and logo, or the seal and logo of a DOC
bureau, shall not be used in any manner to imply endorsement of any
commercial product or activity by DOC or the United States
Government.</sub>
