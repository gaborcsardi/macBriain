
insults <- c(
  "Do your homework.",
  "You have seriously misread the manual page.",
  "You will need to do your homework a lot more carefully.",
  "You don't have enough knowledge to recognise the errors you are making.",
  "Silly.",
  "You do not know what you are doing.",
  "User lack-of-understanding.",
  "I cannot read the documentation for you.",
  "It really is hard to anticipate just how silly you can be.",
  "I am surprised you are surprised.",
  "Do as I say, not do as I do.",
  "You have got Ripleyed.",
  "It's not a question of trying variations, rather of following instructions.",
  "R is lacking a mind_read() function!",
  "The fix requires 'the user' to read the documentation.")

trim <- function(x) {
  gsub("[[:space:]]+", " ", x)
}

shell_escape <- function(x) {
  x <- gsub("'", "", x)
  paste0("'", x, "'")
}

say <- function(text) {
  cmds <- paste("say", shell_escape(text))
  sapply(cmds, system)
}

insulter <- function() {
  msg <- paste0(
    trim(geterrmessage()),
    ". ",
    sample(insults, 1)
  )
  say(msg)
}

.onAttach <- function(libname, pkgname) {
  options(error = insulter)
  invisible()
}

.onUnload <- function(libpath) {
  options(error = NULL)
}

#' Say error messages aloud, on a Mac
#'
#' This package makes R say error messages aloud.
#' For fun, it also adds some remarks that are considered funny
#' by some.
#'
#' To use it, just attach the package with \code{library()} and
#' the don't forget to unmute your speaker.
#'
#' To get rid it, unload the package with \code{unloadNamespace()}.
#'
#' @docType package
#' @name macBriain

NULL
