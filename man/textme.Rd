% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/textme.R
\name{textme}
\alias{textme}
\title{Send a text message.}
\usage{
textme(message = NULL, twilio_sid = NULL, twilio_token = NULL,
  twilio_phone_number = NULL, target_phone_number = NULL)
}
\arguments{
\item{message}{A message to send.}

\item{twilio_sid}{Twilio SID--not needed if supplied in \code{\link{tm_configure()}}.}

\item{twilio_token}{Twilio token--not needed if supplied in \code{\link{tm_configure.R}}.}

\item{twilio_phone_number}{Twilio phone number--not needed if supplied in \code{\link{tm_configure}}.}

\item{target_phone_number}{Target phone number--not needed if supplied in \code{\link{tm_configure}}.}
}
\value{
A text message sent from the twilio phone number to the target phone number.
}
\description{
Send a text message.
}
\examples{

# send a text message
textme()

# send a custom message
textme(message = "A new text message.")

# send a text message to a different number
textme(target_phone_number = "1234567890")

}
