

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\E}{\operatorname{E}}
\newcommand{\se}{\mathsf{se}}

# (PART\*) Course Notes {-}

# Preliminaries {-}

## Notation {-}

Uppercase roman letters, e.g., $X$, will typically denote random variables (rvs); lower case letters, e.g., $x$, will denote a particular value (observation) of a rv. Rvs have probability distributions. Distributions are typically characterized by *parameters* which are fixed real numbers. Parameters describe population characteristics that are often unknown and must be estimated from data. Statistical inference is a tool that will help us to do this.

> ⚠️  Statistical models comprise both rvs and parameters. Be careful not to confuse them! 

## Abbreviations {-}

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> Abbreviation </th>
   <th style="text-align:left;"> Expanded </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> pdf </td>
   <td style="text-align:left;"> probability density function </td>
  </tr>
  <tr>
   <td style="text-align:left;"> cdf </td>
   <td style="text-align:left;"> cumulative distribution function </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rv </td>
   <td style="text-align:left;"> random variable </td>
  </tr>
  <tr>
   <td style="text-align:left;"> iid </td>
   <td style="text-align:left;"> independent and identically distributed </td>
  </tr>
  <tr>
   <td style="text-align:left;"> obs </td>
   <td style="text-align:left;"> observations </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CI </td>
   <td style="text-align:left;"> confidence interval </td>
  </tr>
  <tr>
   <td style="text-align:left;"> df </td>
   <td style="text-align:left;"> degrees of freedom </td>
  </tr>
</tbody>
</table>

## Normal distribution {-#normal-distribution}

Normal distributions play an important role in probability and statistics as they describes many natural phenomenon. For instance, the Central Limit Theorem tells us that sums of rvs are approximately Normal in distribution. 

\BeginKnitrBlock{definition}<div class="definition"><span class="definition" id="def:normal-dist"><strong>(\#def:normal-dist) </strong></span>A continuous rv $X$ has a **normal distribution** with parameters $\mu$ and $\sigma^2$, where $-\infty < \mu < \infty$ and $\sigma > 0$, if $X$ has pdf
\[ f(x; \mu, \sigma) = \frac{1}{\sqrt{2 \pi} \sigma}e^{-(x-\mu)^2/(2\sigma^2)}\,, 
\quad -\infty < x < \infty \,.\]</div>\EndKnitrBlock{definition}

The statement that $X$ is normally distributed with parameters $\mu$ and $\sigma^2$ is abbreviated $X \sim \mathcal{N}(\mu, \sigma^2)$. For $X\sim \mathcal{N}(\mu,\sigma^2)$, it can be shown that $\E(X) = \mu$ and $\Var(X) = \sigma^2$, that is, $\mu$ is the *mean* and $\sigma^2$ is the *variance* of $X$. The pdf takes the form of a bell-shaped curve that is symmetric about $\mu$. The value $\sigma$ (*standard deviation*) is the distance from $\mu$ to the inflection points of the curve. Thus, the position (location) and spread of the distribution depends on $\mu$ and $\sigma$.

<div class="figure">
<img src="00-prelim_files/figure-html/normals-diff-mean-1.png" alt="The pdfs of two normal rvs with different means and the same standard deviations." width="672" />
<p class="caption">(\#fig:normals-diff-mean)The pdfs of two normal rvs with different means and the same standard deviations.</p>
</div>

<div class="figure">
<img src="00-prelim_files/figure-html/normals-diff-sd-1.png" alt="The pdfs of two normal rvs with the same means and different standard deviations." width="672" />
<p class="caption">(\#fig:normals-diff-sd)The pdfs of two normal rvs with the same means and different standard deviations.</p>
</div>

\BeginKnitrBlock{definition}<div class="definition"><span class="definition" id="def:unnamed-chunk-1"><strong>(\#def:unnamed-chunk-1) </strong></span>We say that $X$ has a **standard Normal distribution** if $\mu=0$ and $\sigma = 1$ and we will usually denote standard Normal rvs by $Z$ (why? [tradition!](https://www.youtube.com/watch?v=gRdfX7ut8gw)).</div>\EndKnitrBlock{definition}

### Some useful facts about Normals {-}

Here are some useful facts about how to manipulate Normal rvs.

1. If $X \sim \mathcal{N}(\mu, \sigma^2),$ then $Z = (X - \mu) / \sigma \quad \sim \mathcal{N}(0,1).$ 
2. If $Z \sim \mathcal{N}(0, 1),$ then $X = \mu + \sigma Z \quad \sim \mathcal{N}(\mu, \sigma^2).$ 
3. If $X_i \sim \mathcal{N}(\mu_i, \sigma_i^2)$ for $i = 1, \dots, n$ are independent rvs, then 
\[\sum_{i=1}^{n} X_i \sim \mathcal{N} \left( \sum_{i=1}^{n} \mu_i, \sum_{i=1}^{n} \sigma_i^2 \right) \,.\]

In particular, we note that for differences of independent rvs $X_1 \sim \mathcal{N}(\mu_1, \sigma_1^2)$ and $X_2 \sim \mathcal{N}(\mu_2, \sigma_2^2)$ then the variances also add:
\[ X_1 - X_2 \sim \mathcal{N}(\mu_1 + \mu_2, \sigma_1^2 + \sigma_2^2) \,.\]

Probabilities $P(a \leq X \leq b)$ are found by converting the problem in $X \sim \mathcal{N}(\mu, \sigma^2)$ to the *standard normal* distribution $Z \sim \mathcal{N}(0, 1)$ whose probability values $\Phi(z) = P(Z\leq z)$ can then be looked up in a table. From (1.) above, 
\[\begin{aligned}
   P(a < X < b) &= P\left( \frac{a-\mu}{\sigma} < Z < \frac{b-\mu}{\sigma} \right) \\ 
    &= \Phi \left( \frac{b-\mu}{\sigma}\right) - \Phi\left(\frac{a-\mu}{\sigma}\right) \,.
   \end{aligned}\]

\BeginKnitrBlock{example}<div class="example"><span class="example" id="exm:eg-norm-rt"><strong>(\#exm:eg-norm-rt) </strong></span>Let $X \sim \mathcal{N}(5, 9)$ and find $P(X \geq 5.5)$. 

\[\begin{aligned}
   P(X \geq 5.5) &= P\left(Z \geq \frac{5.5 - 5}{3}\right) \\
    &= P(Z \geq 0.1667) \\
    &= 1 - P(Z \leq 0.1667) \\
    &= 1 - \Phi(0.1667) \\
    &= 1 - 0.5662 \\
    &= 0.4338\,,
    \end{aligned}\]
where we look up the value of $\Phi(z) = P(Z\leq z)$ in a table of standard normal curve areas.</div>\EndKnitrBlock{example}

Alternatively, we can use the `r` code:

```r
pnorm(5.5, mean = 5, sd = 3, lower.tail = FALSE) 
```

```
[1] 0.4338162
```
**TODO**: plot of area under normal curve (right tail)




\BeginKnitrBlock{example}<div class="example"><span class="example" id="exm:eg-norm-dt"><strong>(\#exm:eg-norm-dt) </strong></span>Let $X \sim \mathcal{N}(5, 9)$ and find $P(4 \leq X \leq 5.25)$. 

\[\begin{aligned}
   P(4 \leq X \leq 5.25) &= P\left(\frac{4-5}{3} \leq Z \leq \frac{5.25-5}{3}\right) \\
   &= P(-0.3333 \leq Z \leq 0.0833) \\
   &= \Phi(0.0833) - \Phi(-0.3333) \\
   &= 0.5332 - 0.3694 \\
   &= 0.1638\,.
  \end{aligned}\]
where we look up the value of $\Phi(z) = P(Z\leq z)$ in a table of standard normal curve areas. </div>\EndKnitrBlock{example}

**TODO**: plot area under normal curve (interior)

Alternatively, we can use the `r` code:

```r
pnorm(5.25, mean = 5, sd = 3) - pnorm(4, mean = 5, sd = 3)
```

```
[1] 0.1637654
```

## $t$ distribution {-#t-distribution}


### Properties of $t$ distributions {-}

1. The density for $t_\nu$ is a bell-shaped curve centered at $0$.
2. The density for $t_\nu$ is more spread out than the standard normal density (i.e., it has "fatter tails" than the normal).
3. As $\nu \to \infty$, the spread of the corresponding $t_\nu$ density converges to the standard normal density (i.e., the spread of the $t_\nu$ density decreases relative to the standard normal).
