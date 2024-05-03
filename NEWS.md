# rvisidata 1.0.0

- Revise the package to be CRAN-compliant
- First CRAN release

# rvisidata 0.0.3

- Add `jsonlite` as optional dependency
- Prefer to serialize dataframes as `json` if `jsonlite` is installed

# rvisidata 0.0.2

- Optionally support integration with `tmux` ( @mstr3336 #3 )
- No longer delete the temporary file when `vd` returns
  Instead, it will be cleaned up when R is terminated

# rvisidata 0.0.1

- Loose `readr` and `magrittr` dependency

# rvisidata 0.0.0.9000

- Initial project release on GitHub
- Added a `NEWS.md` file to track changes to the package.
