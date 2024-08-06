### Overview
Input and Output files for example scripts in GentzkowLabTemplate

### Source

#### Raw Data

* `mpg.csv` is the raw data file for the examples. `mpg.csv` was exported from the `mpg` dataset shipped with R's ggplot2 package. See [here](https://rpubs.com/shailesh/mpg-exploration) for more detail. Exported manually by Matthew Gentzkow 12/15/2023.

#### Intermediate Datasets
* `stata/mpg.dta` was produced by the script `wrangle_data.do` in `/examples/stata/`.
* `R/mpg.Rdata` was produced by the script `wrangld_data.r` in `/examples/r/`.

#### Intermediate Outputs
* `stata/figure_city.jpg`, `stata/figure_hwy.jpg`, and `stata/table_reg.tex` were produced by the script `analyzed_data.do` in `/examples/stata/`.
* `R/figure_city.jpg`, `R/figure_hwy.jpg`, and `R/table_reg.tex` were produced by the script `analyzed_data.r` in `/examples/R/`.
* `python/figure_city.jpg`, `python/figure_hwy.jpg`, and `python/table_reg.tex` were produced by the script `analyzed_data.py` in `/examples/python/`.

