```{r setup, include=FALSE}
# packages
library(RColorBrewer)
library(viridis)
library(scales)
library(readr)
library(ggplot2)
library(cowplot)
library(tidyverse)
library(reshape2)
library(latex2exp)
library(svglite)
library(knitr)
library(kableExtra)
library(formattable)
library(flextable)
library(dplyr)
library(datasets)
library(infer)
library(fontawesome)

options(knitr.kable.NA = '')

# ggplot theme
if (knitr::is_html_output()){
  theme_set(theme_gray(base_size = 12))
  knitr::opts_chunk$set(echo = TRUE, fig.asp = 0.6, dev = "svglite", fig.align = "center")
} else {
  theme_set(theme_bw(base_size = 10))
  knitr::opts_chunk$set(echo = TRUE, fig.width = 6, fig.asp = 0.6)
}
theme_ur <- theme(legend.justification = c(1,1), legend.position = c(1,1), legend.box.margin = margin(c(4, 4, 4, 4), unit = "pt"))
theme_lr <- theme(legend.justification = c(1,0), legend.position = c(1,0), legend.box.margin = margin(c(4, 4, 4, 4), unit = "pt"))
options(width = 90, knitr.kable.NA = '')

lsz <- 1.0
tsz <- 4
data(iris)
data(trees)
```

\DeclareMathOperator{\E}{\mathbf{E}} 
\DeclareMathOperator{\Var}{Var}
\DeclareMathOperator{\Cov}{Cov}
\DeclareMathOperator{\corr}{corr}
\DeclareMathOperator{\sd}{sd}
\newcommand{\se}{\mathsf{se}}

