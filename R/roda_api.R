roda_api <- function(){
  plumber::plumb(file='inst/apiModelo/plumber.R')$run()
}
