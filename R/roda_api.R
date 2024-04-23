roda_api <- function(){
  plumber::plumb(file='inst/apiModelo/plumber.R')$run(
    host = "0.0.0.0", port = 123, swagger = TRUE
  )
}
