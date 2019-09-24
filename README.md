
<!-- README.md is generated from README.Rmd. Please edit that file -->

# textme

<!-- badges: start -->

<!-- badges: end -->

The heart of this package is a single function called `textme()` that
sends you a text message 📱 the instant a long-running job completes ⌛✔️.

This allows you to leave your computer while running code, and know
exactly when to return 🎉.

![](https://github.com/richpauloo/junkyard/blob/master/img/textme.png?raw=true)

## Installation

<!-- You can install the released version of textme from [CRAN](https://CRAN.R-project.org) with: -->

<!-- ``` r -->

<!-- install.packages("textme") -->

<!-- ``` -->

`textme` is not currently on CRAN. Install the development version from
github:

``` r
devtools::install_github("richpauloo/textme")
```

## Example

First, sign up for a free Twilio trial account.

  - Use my [referral link](www.twilio.com/referral/rIaK9w), and you and
    I will both get $10 in free credit if you wish to upgrade (\~1,250
    messages).  
  - Use the [regular sign up](https://www.twilio.com/), and bypass the
    bonus (you can always use the referral link later if you want to
    upgrade your free trial version).

Next, set up a project and verify your number.

Then, provide information about your twilio account and the number you
want to text.

``` r
library(textme)

# replace the values here with your own
tm_configure(twilio_sid   = "AC1ffb4917879549a0f0720c0214bde131",
             twilio_token = "f5c8904b9af81daf3e8dda09f975c369",
             twilio_phone_number = "1234567890",
             target_phone_number = "0987654321")
```

The above code needs to be run only once. Now, and in future R sessions,
simply run the following to text yourself.

``` r
textme()
```

You can supply a custom message with the `message` argument:

``` r
textme(message = "Back to work! You're not paid to run around and drink coffee all day!")
```

## Acknowledgments

This package wouldn’t be possible without the [{ twilio
}](https://github.com/seankross/twilio) package from Sean Kross, [{
devtools }](https://github.com/r-lib/devtools), [{
roxygen2}](https://github.com/r-lib/roxygen2), and
[RStudio](https://www.rstudio.com/).
