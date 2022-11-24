# rvisidata

<!-- TOC depthFrom:2 -->

- [Installation](#installation)
  - [Visidata](#visidata)
  - [Package](#package)
- [Example](#example)
- [How it Works](#how-it-works)
- [Limitations](#limitations)
- [Credits](#credits)

<!-- /TOC -->

The goal of rvisidata is to combine the power of [Visidata](https://visidata.org/), _"A Swiss Army Chainsaw for Data"_, with `R`.

## Installation

### Visidata

You need to have Visidata installed. Please follow the official installation instructions [provided here](https://visidata.org/install/).
If you already have python3 installed, the easiest way to install it is with `pip3`: `pip3 install visidata`.

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

## How it Works

Internally, `rvisidata` writes the data frame as a csv file to a temporary folder and then loads it with `visidata`. Be therefore careful with very large data frames, because the writing process can take a while. It will delete the temporary file after the `visidata` session is closed.

I do not claim that this implementation is efficient or very elegant. But it works. Suggestions for making it faster are very welcome.

## Options

This package supports integration with `tmux`. 

The default behaviour is to open `vd` in a vertical pane above the current pane, if R is running in a `tmux` session.

To disable this, set:

```r
options(rvisidata.cmd = FALSE)
```

If you're using the `kitty` terminal emulator (https://github.com/kovidgoyal/kitty), you can also open `vd` in a new tab within kitty, like this:

```r
options(rvisidata.cmd = "kitty")
```

### Advanced

To customize the way `tmux` or `kitty` set up this workspace (For example, opening `vd` in a new window rather than pane), you 
may supply your own shell script that invokes `vd` on your dataset.

Set:

```r
options(rvisidata.cmd = "path/to/your/script")
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

## Limitations

Right now this tool only opens the data frame and discards any changes you make for two reasons: (1) you should do your data manipulation in `R` to have a reproducible analysis workflow and (2) it is easier to implement this way 😇.

## Credits

[Visidata](https://visidata.org) is designed and developed by Saul Pwanson ([official GitHub repository](https://github.com/saulpw/visidata)).
