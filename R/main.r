#' Open data with visidata
#'
#' @export
#' @param dat dataframe; Data you want to to visualize with visidata
vd <- function(dat) {
  # R gives us a temporary file
  temp_file <- tempfile("dat", fileext = ".csv")
  # Write input to the temporary file
  write.csv(dat, temp_file)
  
  # Check if we should use vd directly, 
  # or a tmux wrapper
  vd_cmd <- get_vd_cmd() 

  # Invoke visidata
  system(paste0(vd_cmd, " ", temp_file))
  # Delete the temporary file
  # We wrap it in "invisible" to remove the "TRUE" output when file.remove deleted the temporary file
  invisible(file.remove(temp_file))
}
