# rvisidata

<!-- TOC depthFrom:2 -->

- [Installation](#installation)
  - [Visidata](#visidata)
  - [Package](#package)
- [Example](#example)
- [How it Works](#how-it-works)

<!-- /TOC -->

The goal of rvisidata is to combine the power of [Visidata](https://visidata.org/), − _"A Swiss Army Chainsaw for Data"_ − to `R`

## Installation

### Visidata

You need to have Visidata installed on your system. You can install it either using `pip3`.

```bash
pip3 install visidata
```

To verify it is installed correctly, `vd --version` should print out the installed version of visidata.

### Package

Visidata can only be installed with devtools from the official GitHub repo:

```r
devtools::install_github('paulklemm/rvisidata')
```

## Example

The package gives you the `vd` function in `R`, which takes in any data frame and opens it with visidata.

```r
vd(iris)
```

## How it Works

Internally, `rvisidata` writes the data frame as a csv file to a temporary folder and then loads it with `visidata`. Be therefore careful with very large data frames, because the writing process can take a while.
