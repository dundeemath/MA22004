library(infer)


mu_hat <- gss %>%
 specify(response = hours) %>%
 calculate(stat = "mean")

null_dist <- gss %>%
 specify(response = hours) %>%
 hypothesise(null = "point", mu = 40) %>%
 generate(reps = 1000, type = "bootstrap") %>%
 calculate(stat = "mean")

null_dist %>%
 visualise() +
 shade_p_value(obs_stat = mu_hat, direction = "two-sided")

p_value <- null_dist %>%
 get_p_value(obs_stat = mu_hat, direction = "two-sided")
p_value

null_dist %>%
 get_confidence_interval(point_estimate = mu_hat, level = 0.95, type = "se")

data("trees")

mu_hat <- trees %>% 
 specify(response = Height) %>% 
 calculate(stat = "mean")

data("iris")

mu_hat <- iris %>%
 specify(response = Petal.Length) %>%
 calculate(stat = "mean")

null_dist <- iris %>%
 specify(response = Petal.Length) %>%
 hypothesise(null = "point", mu = 3.5) %>%
 generate(reps = 1000, type = "bootstrap") %>%
 calculate(stat = "mean")

null_dist %>%
 visualise() +
 shade_p_value(obs_stat = mu_hat, direction = "two-sided")

data("trees")

s <- trees %>%
 specify(response = Volume) %>%
 calculate(stat = "sd")

s <- sd(trees$Volume)

null_dist <- trees %>%
 specify(response = Volume) %>%
 generate(reps = 1000, type = "bootstrap") %>%
 calculate(stat = "sd")

ci <- null_dist %>%
 get_confidence_interval(point_estimate = s, level = 0.95, type = "se")

null_dist %>% 
 visualise() + shade_ci(ci)
