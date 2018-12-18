#' Open data with visidata
#'
#' @export
#' @import magrittr readr
#' @param dat dataframe; Data you want to to visualize with visidata
vd <- function(dat) {
  # R gives us a temporary file
  temp_file <- tempfile("dat", fileext = ".csv")
  # Write input to the temporary file
  dat %>%
    readr::write_csv(temp_file)
  # Invoke visidata
  system(paste0("vd ", temp_file))
  # Delete the temporary file
  file.remove(temp_file) %>%
    # We wrap it in "invisible" to remove the "TRUE" output, which file.remove will give
    invisible()
}