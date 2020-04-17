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
  system2(vd_cmd, args = temp_file)
  # We do not delete the temporary file, as if tmux is used, 
  # vd will run asynchronously, and we can't guarantee that it's opened
  # the file yet. 
  # We can rely on R to clean it up when the session ends

  invisible(dat)
}
