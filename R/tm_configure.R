#' Store Twilio SID, Twilio token, Twilio phone number, and target phone number for later use.
#'
#' @param twilio_sid Your Twilio SID.
#' @param twilio_token Your Twilio Token.
#' @param twilio_phone_number Your Twilio phone number.
#' @param target_phone_number The phone number you want to receive a text message at
#' @param overwrite By default, this is set to \code{FALSE}. If \code{TRUE}, R will overwrite existing .Renviron variables that match the ones named in this function.
#'
#' @return A .Renviron file that stores the supplied paramaters for ease of use in future R sessions.
#'
#' @examples
#'
#' # set parameters
#' tm_configure(twilio_sid   = "AC1ffb497954c02119a0f0720784bde131",
#'              twilio_token = "f5c8af81ddadaf3e8904b909f975c369",
#'              twilio_phone_number = "1234567890",
#'              target_phone_number = "0987654321")
#'
#' # view and edit the .Renvion file
#' file.edit("~/.Renviron")
#'
#' @export

tm_configure <- function(twilio_sid = NULL,
                         twilio_token = NULL,
                         twilio_phone_number = NULL,
                         target_phone_number = NULL,
                         overwrite = FALSE){

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # enforce completeness
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  if (is.null(twilio_sid))
    stop ("Please supply your Twilio SID in the `twilio_sid` argument.")
  if (is.null(twilio_token))
    stop ("Please supply your Twilio token in the `twilio_token` argument.")
  if (is.null(twilio_phone_number))
    stop ("Please supply your Twilio phone number in the `twilio_phone_number` argument.")
  if (is.null(target_phone_number))
    stop ("Please supply your target phone number in the `target_phone_number` argument.")


  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # store variables in .Renviron
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  # open the .Renviron file to store API info
  if (!file.exists("~/.Renviron"))  # only create if not already there
    file.create("~/.Renviron")     # (don't overwrite it)
  renv <- readLines("~/.Renviron") # read the .Renviron file

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Manage overwite conditions
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Twilio SID

  # if a Twilio SID is already set, but overwrite permission isn't granted
  if (sum(grepl("TWILIO_SID", renv)) > 0 & isFALSE(overwrite))
    stop ("TWILIO_SID is already set in .Renviron. If you wish to overwrite it, set the `overwrite` argument to TRUE.")

  # if a Twilio SID is already set, and overwrite permission is granted
  if (sum(grepl("TWILIO_SID", renv)) > 0 & isTRUE(overwrite))
    renv[grep("TWILIO_SID", renv)] <- paste("TWILIO_SID =", twilio_sid)

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Twilio token

  # if a Twilio token is already set, but overwrite permission isn't granted
  if (sum(grepl("TWILIO_TOKEN", renv)) > 0 & isFALSE(overwrite))
    stop ("TWILIO_TOKEN is already set in .Renviron. If you wish to overwrite it, set the `overwrite` argument to TRUE.")

  # if a Twilio token is already set, and overwrite permission is granted
  if (sum(grepl("TWILIO_TOKEN", renv)) > 0 & isTRUE(overwrite))
    renv[grep("TWILIO_TOKEN", renv)] <- paste("TWILIO_TOKEN =", twilio_token)

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Twilio phone number

  # if a Twilio token is already set, but overwrite permission isn't granted
  if (sum(grepl("TWILIO_PHONE_NUMBER", renv)) > 0 & isFALSE(overwrite))
    stop ("TWILIO_PHONE_NUMBER is already set in .Renviron. If you wish to overwrite it, set the `overwrite` argument to TRUE.")

  # if a Twilio token is already set, and overwrite permission is granted
  if (sum(grepl("TWILIO_PHONE_NUMBER", renv)) > 0 & isTRUE(overwrite))
    renv[grep("TWILIO_PHONE_NUMBER", renv)] <- paste("TWILIO_PHONE_NUMBER =",
                                                     twilio_phone_number)

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # target phone number

  # if a Twilio token is already set, but overwrite permission isn't granted
  if (sum(grepl("TARGET_PHONE_NUMBER", renv)) > 0 & isFALSE(overwrite))
    stop ("TARGET_PHONE_NUMBER is already set in .Renviron. If you wish to overwrite it, set the `overwrite` argument to TRUE.")

  # if a Twilio token is already set, and overwrite permission is granted
  if (sum(grepl("TARGET_PHONE_NUMBER", renv)) > 0 & isTRUE(overwrite))
    renv[grep("TARGET_PHONE_NUMBER", renv)] <- paste("TARGET_PHONE_NUMBER =",
                                                     target_phone_number)


  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # if creating .Renviron from scratch
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  if (sum(grepl("TWILIO_SID", renv)) == 0)
    renv <- c(renv,
              paste("TWILIO_SID =", twilio_sid)
    )
  if (sum(grepl("TWILIO_TOKEN", renv)) == 0)
    renv <- c(renv,
              paste("TWILIO_TOKEN =", twilio_token)
    )
  if (sum(grepl("TWILIO_PHONE_NUMBER", renv)) == 0)
    renv <- c(renv,
              paste("TWILIO_PHONE_NUMBER =", twilio_phone_number)
    )
  if (sum(grepl("TARGET_PHONE_NUMBER", renv)) == 0)
    renv <- c(renv,
              paste("TARGET_PHONE_NUMBER =", target_phone_number)
    )


  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # ensure one blank line at the end of .Renviron and write file
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  if (nchar(renv[length(renv)]) > 0)
    renv <- c(renv, "")

  writeLines(renv, "~/.Renviron")


  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # set variables for this session so R doesn't need to be restarted
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Sys.setenv(TWILIO_SID = twilio_sid)
  Sys.setenv(TWILIO_TOKEN = twilio_token)
  Sys.setenv(TWILIO_PHONE_NUMBER = twilio_phone_number)
  Sys.setenv(TARGET_PHONE_NUMBER = target_phone_number)


  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # verify success
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  cat("Success! You've stored your Twilio credentials as environmental variables in '~/.Renviron', and your new .Renvion file looks like this: ")
  cat(paste(c("\n", renv), collapse="\n"))

}
