#' Check if visidata is installed
#'
#' This function checks if visidata is installed on the system.
#' If not, it stops the execution and prompts the user to install visidata.
#'
#' @return No return value. If visidata is not installed, the function stops execution.
#' @export
check_vd <- function() {
  if (system("vd --version", ignore.stdout = TRUE, ignore.stderr = TRUE) != 0) {
    stop("visidata is not installed. Please install visidata and try again.", call. = FALSE)
  }
}

#' Open dataframe using visidata
#'
#' This function opens a dataframe in visidata. It first checks if jsonlite is installed,
#' and if so, it uses jsonlite to write the dataframe to a temporary json file.
#' If jsonlite is not installed, it writes the dataframe to a temporary csv file.
#' It then opens the temporary file in visidata.
#'
#' @param dat The dataframe to open in visidata.
#' @return The original dataframe, invisibly.
#' @export
vd <- function(dat) {
  
  # Check if visidata is installed
  check_vd()

  file_ext <- ".csv"
  serialize_fun <- utils::write.csv

  # Prefer to use json over CSV format
  if (requireNamespace("jsonlite")) {
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
