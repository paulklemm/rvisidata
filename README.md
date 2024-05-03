# rvisidata

The goal of rvisidata is to combine the power of [Visidata](https://visidata.org/), _"A Swiss Army Chainsaw for Data"_, with `R`.

## Installation

### Visidata

You need to have Visidata installed. Please follow the official installation instructions [provided here](https://visidata.org/install/).

To verify visidata is installed correctly, `vd --version` should print out the installed version.

### Package

rvisidata can be installed with devtools from the official GitHub repo:

```r
devtools::install_github('paulklemm/rvisidata')
```

## Example

```r
vd(iris)
```

## Options

This package supports integration with `tmux`.

The default behavior is to open `vd` in a vertical pane above the current pane, if R is running in a `tmux` session.

To disable this, set:

```r
options(rvisidata.tmux = FALSE)
```

### Advanced

To customize the way `tmux` sets up this workspace (For example, opening `vd` in a new window rather than pane), you 
may supply your own shell script that invokes `vd` on your dataset.

Set:

```r
options(rvisidata.tmux = "path/to/your/script")
```

Your script should take one argument, the filename to be opened.

For example, the following will open your dataframe in a vertical split
above the R console window, and return focus back to R:

```bash
#!/bin/bash

filename=$1

tmux split-window -vb -p 70 "vd $filename" \; \
  select-pane -l
```

## How it Works

Internally, `rvisidata` writes the data frame as a `csv` file to a temporary folder and then loads it with `visidata`. Be therefore careful with very large data frames, because the writing process can take a while. It will delete the temporary file after the `visidata` session is closed.

I do not claim that this implementation is efficient or elegant. But it works. Suggestions for making it faster are very welcome.

## Limitations

This tool opens the data frame and discards any changes you make for two reasons: (1) you should do your data manipulation in `R` to have a reproducible analysis workflow and (2) it is easier to implement this way 😇.

## Credits

[Visidata](https://visidata.org) is designed and developed by Saul Pwanson ([official GitHub repository](https://github.com/saulpw/visidata)).
