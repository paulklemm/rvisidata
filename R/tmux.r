
get_vd_cmd <- function() {
  tmux_cmd <- getOption("rvisidata.tmux")
  
  if (length(Sys.getenv("TMUX")) == 0) return("vd")
  
  # Check for null before checking value
  # Null input clobbers logical returns (returns 0 length)
  # Default to having tmux enabled
  if (is.null(tmux_cmd)) return(system.file("tmux_pane.sh", package = "rvisidata"))
  
  # If explicitly set to false, diable tmux
  if (tmux_cmd == FALSE ) return("vd")
  
  # Users can choose their own script
  return(tmux_cmd)
}
