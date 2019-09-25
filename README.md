
<!-- README.md is generated from README.Rmd. Please edit that file -->

# textme

<!-- badges: start -->

<!-- badges: end -->

The heart of this package is a single function called `textme()` that
sends you a text message 📱 the instant a long-running job completes ⌛✔️.

Now you can leave the computer while it crunches away. Go get a cofee,
hit the gym, or work on other things\! You’ll be notified exactly when
your job completes 🎉.

![](https://github.com/richpauloo/junkyard/blob/master/img/textme.png?raw=true)

## Installation

<!-- You can install the released version of textme from [CRAN](https://CRAN.R-project.org) with: -->

<!-- ``` r -->

<!-- install.packages("textme") -->

<!-- ``` -->

**textme** is not currently on CRAN. Install the development version
from github:

``` r
devtools::install_github("richpauloo/textme")
```

## Example

First, sign up for a free Twilio trial account.

1.  [regular sign up](https://www.twilio.com/)  
2.  [my referral link](https://www.twilio.com/referral/rIaK9w), and if
    you decide down the line to upgrade to a paid Twilio account (I have
    one), you and I both get $10 in free credit (\~1,250 messages).

It doesn’t matter to me which road you take. Go for option 1. just to
get started.

Next, [set up a
project](https://support.twilio.com/hc/en-us/articles/360011177133-View-and-Create-New-Projects-in-Twilio-Console)
and [verify your
number](https://support.twilio.com/hc/en-us/articles/223180048-Adding-a-Verified-Phone-Number-or-Caller-ID-with-Twilio).
The Twilio docs are good for this.

Then, provide information about your twilio account and the number you
want to text. These variables are stored in `"~/.Renviron"` for later
use.

``` r
library(textme)

# replace the values here with your own
tm_configure(twilio_sid   = "AC1ffb4917879549a0f0720c0214bde131",
             twilio_token = "f5c8904b9af81daf3e8dda09f975c369",
             twilio_phone_number = "1234567890",
             target_phone_number = "0987654321")
```

The above code needs to be run only once. Now, and in future R sessions,
simply throw a `textme()` at the end of a long-running job (**textme**
comes pre-loaded with a handful of fun messages):

``` r
Sys.sleep(5) # some long-running job
textme()     # text me when it's done!
```

Or, you can supply a custom message with the `message` argument:

``` r
textme(message = "👹 Back to work! You're not paid to run around and drink ☕ all day!")
```

## Acknowledgments

This package is inspired by [{ beepr
}](https://www.r-project.org/nosvn/pandoc/beepr.html), and wouldn’t be
possible without the [{ twilio }](https://github.com/seankross/twilio)
package from Sean Kross, [{ devtools
}](https://github.com/r-lib/devtools), [{
roxygen2}](https://github.com/r-lib/roxygen2), and
[RStudio](https://www.rstudio.com/).
