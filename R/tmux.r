#' Get visidata command
#' @return visidata command as string
get_vd_cmd <- function() {

    default_cmd <- "vd"
    cmd <- getOption("rvisidata.cmd")

    # If explicitly set to false, disable external cmd
    if (!is.null(cmd) && cmd == FALSE) {
        return(default_cmd)
    }

    # If explicitly set to "kitty" use the default kitty cmd
    if (!is.null(cmd) && cmd == "kitty") {
        return(system.file("kitty_window.sh", package = "rvisidata"))
    }

    # If a custom cmd is set return that cmd
    if (!is.null(cmd)) {
        return(cmd)
    }

    # Check if we're working inside tmux; if positive, return the default tmux
    # cmd
    if (Sys.getenv("TMUX") != "") {
        return(system.file("tmux_pane.sh", package = "rvisidata"))
    }

    # Return the default in case none of the above applies
    return(default_cmd)
}
