N <- 6
m <- floor(runif(N, min = 6, max = 9))
df <- tibble(category = character(), obs = numeric())
for(i in 1:N){
 category <- rep(i, m[i])
 obs <- rnorm(m[i], mean = 68 + rnorm(1, mean = 0, sd = 10), sd = 3)
 newdf <- cbind(category, obs)
 df <- rbind(df, newdf)
}
write.csv(df, file = "data/anova-samples.csv", row.names = FALSE)

# ***
```{r anova-samples-stats, echo = FALSE, warning = FALSE, message = FALSE}
df <- read_csv("data/anova-samples.csv")
df$category <- factor(df$category, levels = seq(1, 6), labels = LETTERS[1:6])
dattab <- df %>%
 group_by(category) %>%
 summarise(observations = list(signif(obs, digits = 4)), n = n(), means = signif(mean(obs), digits = 5), ssds = signif(sd(obs), digits = 4))
kable(dattab, col.names = c('Population', 'Observations', 'Size $(m_i)$', 'Sample Mean $(\\overline{x}_i)$', 'Sample SD $(s_i)$'), align = "clccc", caption = "Data and summary sample statistics for Figure \\@ref(fig:anova-samples-boxplots).")
```

```{r anova-samples-boxplots, echo = FALSE, warning = FALSE, message = FALSE, fig.cap = "Box plots of sample data for $k = 6$ populations A through F."}
df <- read_csv("data/anova-samples.csv")
df$category <- factor(df$category, levels = seq(1, 6), labels = LETTERS[1:6])
ggplot(df, aes(x = obs, y = reorder(category, desc(category)))) + geom_boxplot() + theme(axis.title.y = element_blank())
```   