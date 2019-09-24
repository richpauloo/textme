
<!-- README.md is generated from README.Rmd. Please edit that file -->

# textme

<!-- badges: start -->

<!-- badges: end -->

The heart of this package is a single function called `textme()` that
sends you a text message 📱 the instant a long-running job completes.
This allows you to leave your computer while running code, and know
exactly when to return 🎉.

![](https://pbs.twimg.com/media/EEO4ugSUcAA_x2C?format=jpg&name=900x900)

## Installation

You can install the released version of textme from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("textme")
```

Or install the development version from github:

``` r
devtools::install_github("richpauloo/textme")
```

## Example

Before sending any messages, you need to provide information about your
twilio account and the number you want to text.

``` r
library(textme)

# replace the values here with your own
tm_configure(twilio_sid   = "AC1ffb4919a0f0720787954c0214bde131",
             twilio_token = "f5c8daf3e8904b9af81dda09f975c369",
             twilio_phone_number = "1234567890",
             target_phone_number = "0987654321")
```

The above code needs to be run only once. Now, and in future R sessions,
simply run the following to text yourself.

``` r
textme()
```
