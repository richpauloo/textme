#' Send a text message.
#'
#' @param message A message to send.
#' @param twilio_sid Twilio SID--not needed if supplied in \code{\link{tm_configure()}}.
#' @param twilio_token Twilio token--not needed if supplied in \code{\link{tm_configure.R}}.
#' @param twilio_phone_number Twilio phone number--not needed if supplied in \code{\link{tm_configure}}.
#' @param target_phone_number Target phone number--not needed if supplied in \code{\link{tm_configure}}.
#'
#' @return A text message sent from the twilio phone number to the target phone number.
#'
#' @examples
#'
#' # send a text message
#' textme()
#'
#' # send a custom message
#' textme(message = "A new text message.")
#'
#' # send a text message to a different number
#' textme(target_phone_number = "1234567890")
#'
#' @export

textme <- function(message = NULL,
                   twilio_sid = NULL,
                   twilio_token = NULL,
                   twilio_phone_number = NULL,
                   target_phone_number = NULL){

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # set the target phone number
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  # if the target is not provided (NULL):
  if(is.null(target_phone_number)){

    # check that it's been previously saved by tm_configure()
    if(nchar(Sys.getenv("TARGET_PHONE_NUMBER")) == 0)
      stop("Either provide your target phone number in the `target_phone_number` argument, or specify it in `tm_configure()`.")

    # if it's been saved in tm_confgure, access it.
    if(nchar(Sys.getenv("TARGET_PHONE_NUMBER")) > 0)
      target_phone_number <- Sys.getenv("TARGET_PHONE_NUMBER")

  }

  # if the target is provided (! NULL):
  if(!is.null(target_phone_number)){

    # check that it has class == vector
    if(!is.vector(target_phone_number))
      stop(paste0("`target_phone_number` must be of class `vector`, not `",
                  class(target_phone_number), "`."))


    # check that it's a vecotr of length 1
    if(length(target_phone_number) > 1)
      stop(paste0("`target_phone_number` must be a vector of length 1. It is currently a vector of length ",
                  length(target_phone_number), "."))

    # if it's a vector of length 1, coerce it to character
    if(length(target_phone_number) == 1)
      target_phone_number <- as.character(target_phone_number)

  }

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # set the twilio phone number
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  # if the twilio number is not provided (NULL):
  if(is.null(twilio_phone_number)){

    # check that it's been previously saved by tm_configure()
    if(nchar(Sys.getenv("TWILIO_PHONE_NUMBER")) == 0)
      stop("Either provide your Twilio phone number in the `twilio_phone_number` argument, or specify it in `tm_configure()`.")

    # if it's been saved in tm_confgure, access it.
    if(nchar(Sys.getenv("TWILIO_PHONE_NUMBER")) > 0)
      twilio_phone_number <- Sys.getenv("TWILIO_PHONE_NUMBER")

  }

  # if the twilio number is provided (! NULL):
  if(!is.null(twilio_phone_number)){

    # check that it has class == vector
    if(!is.vector(twilio_phone_number))
      stop(paste0("`twilio_phone_number` must be of class `vector`, not `",
                  class(twilio_phone_number), "`."))


    # check that it's a vector of length 1
    if(length(twilio_phone_number) > 1)
      stop(paste0("`twilio_phone_number` must be a vector of length 1. It is currently a vector of length ",
                  length(twilio_phone_number), "."))

    # if it's a vector of length 1, coerce it to character
    if(length(twilio_phone_number) == 1)
      twilio_phone_number <- as.character(twilio_phone_number)

  }

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # set the twilio sid
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  # if the twilio sid is not provided (NULL):
  if(is.null(twilio_sid)){

    # check that it's been previously saved by tm_configure()
    if(nchar(Sys.getenv("TWILIO_SID")) == 0)
      stop("Either provide your Twilio SID in the `twilio_sid` argument, or specify it in `tm_configure()`.")

    # if it's been saved in tm_confgure, access it.
    if(nchar(Sys.getenv("TWILIO_SID")) > 0)
      twilio_sid <- Sys.getenv("TWILIO_SID")

  }

  # if the twilio sid is provided (! NULL):
  if(!is.null(twilio_sid)){

    # check that it has class == vector
    if(!is.vector(twilio_sid))
      stop(paste0("`twilio_sid` must be of class `vector`, not `",
                  class(twilio_sid), "`."))


    # check that it's a vector of length 1
    if(length(twilio_sid) > 1)
      stop(paste0("`twilio_sid` must be a vector of length 1. It is currently a vector of length ",
                  length(twilio_sid), "."))

    # if it's a vector of length 1, coerce it to character
    if(length(twilio_sid) == 1)
      twilio_sid <- as.character(twilio_sid)

  }


  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # set the twilio token
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  # if the twilio token is not provided (NULL):
  if(is.null(twilio_token)){

    # check that it's been previously saved by tm_configure()
    if(nchar(Sys.getenv("TWILIO_TOKEN")) == 0)
      stop("Either provide your Twilio SID in the `twilio_token` argument, or specify it in `tm_configure()`.")

    # if it's been saved in tm_confgure, access it.
    if(nchar(Sys.getenv("TWILIO_TOKEN")) > 0)
      twilio_token <- Sys.getenv("TWILIO_TOKEN")

  }

  # if the twilio token is provided (! NULL):
  if(!is.null(twilio_token)){

    # check that it has class == vector
    if(!is.vector(twilio_token))
      stop(paste0("`twilio_token` must be of class `vector`, not `",
                  class(twilio_token), "`."))


    # check that it's a vector of length 1
    if(length(twilio_token) > 1)
      stop(paste0("`twilio_token` must be a vector of length 1. It is currently a vector of length ",
                  length(twilio_token), "."))

    # if it's a vector of length 1, coerce it to character
    if(length(twilio_token) == 1)
      twilio_token <- as.character(twilio_token)

  }


  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # determine the message
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  # a message is provided
  if(!is.null(message))
    body = as.character(message)

  # a message is not provided, so create one
  if(is.null(message))
    body = sample(premade_messages, 1)


  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # send the message
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  twilio::tw_send_message(from = twilio_phone_number,
                          to = target_phone_number,
                          body = body)

}
