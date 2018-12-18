# rvisidata

<!-- TOC depthFrom:2 -->

- [Installation](#installation)
  - [Visidata](#visidata)
  - [Package](#package)
- [Example](#example)
- [How it Works](#how-it-works)

<!-- /TOC -->

The goal of rvisidata is to combine the power of [Visidata](https://visidata.org/), _"A Swiss Army Chainsaw for Data"_, with `R`

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
