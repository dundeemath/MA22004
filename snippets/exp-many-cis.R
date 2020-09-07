df <- tibble(xbar = numeric(), l = numeric(), u = numeric())
n <- 60
for(i in 1:50){
  x <- rnorm(n, mean = 0, sd = 1)
  df <- df %>% add_row(xbar = mean(x), l = xbar - 1.96*sd(x)/sqrt(n), u = xbar + 1.96*sd(x)/sqrt(n))
}
df$star <- ifelse( df$l <= 0 & df$u >= 0, "", "*")
write.csv(df, file = "data/exp-many-cis.csv")