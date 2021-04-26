#' Open dataframe using visidata
#'
#' @export
#' @param dat dataframe to open in visidata
vd <- function(dat) {
  file_ext <- ".csv"
  serialize_fun <- write.csv

  # Prefer to use json over CSV format
  if (require("jsonlite")) {
    file_ext <- ".json"
    serialize_fun <- jsonlite::write_json
  }

  # R gives us a temporary file
  temp_file <- tempfile("dat", fileext = file_ext)
  # Write input to the temporary file
  serialize_fun(dat, temp_file)

  # Check if we should use vd directly or a tmux wrapper
  vd_cmd <- get_vd_cmd()

  # Invoke visidata
  system2(vd_cmd, args = temp_file)
  # We do not delete the temporary file, as if tmux is used,
  # vd will run asynchronously, and we can't guarantee that it's opened
  # the file yet.
  # We can rely on R to clean it up when the session ends
  invisible(dat)
}
