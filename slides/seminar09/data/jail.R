library(tidyverse)

pop <- tibble(race = c(rep("White",19705), rep("Asian",412), rep("Black",276), rep("Other",121)))
samp <- sample_n(pop, 2000, replace = FALSE)

samp %>% group_by(race) %>% summarise(n = n())
