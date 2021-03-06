

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\E}{\operatorname{E}}
\newcommand{\se}{\mathsf{se}}

# Categorical data {#categorical-data}

## Multinomial experiments

Suppose we have a population that is divided into $k > 2$ distinct categories. We consider an experiment where we select $m$ individuals (or objects) from the population and categorize each one. We denote the proportion of the population in the $i$th category by $p_i$. 
If the sample size $m$ is much smaller than the population size $M$ (so that the $m$ trials are independent), this experiment will be approximately *multinomial* with success probability $p_i$ for each category, $i=1, \dots, k$. 

Before the experiment is performed, we denote the number (or count) of the trails resulting in category $i$ by the rv $N_i$. The expected number of trails that result in category $i$ is given by 
\begin{equation}
\E[N_i] = m p_i\,, \quad i=1, \dots, k\,.
(\#eq:mean-count-multinomial)
\end{equation} 
After the experiment is performed, we denote the corresponding observed value by $n_i$. Since the trials result in distinct categories, 
\begin{equation*}
\sum_{i=1}^k N_i = \sum_{i=1}^{k} n_i = m \,,
\end{equation*}
which indicates that, for a given $m$, we only need to observe $k-1$ of the variables to be able to work out what the $k$th variable should be. 

## Goodness-of-fit for a single factor {#goodness-of-fit-tests}

We are interested in making inferences about the proportion parameters $p_i$. Specifically, we will consider the null hypothesis,
\begin{equation}
H_0 : p_1 = p_{10}\,, p_2 = p_{20}\,, \cdots\,, p_k = p_{k0}\,,
 (\#eq:null-multinomial)
\end{equation}
that completely specifies a value $p_{i0}$ for each $p_i$.^[Here for $i=1, \dots, k$ we use the notation $p_{i0}$ to denote the value of $p_i$ claimed under the null hypothesis.] The alternative hypothesis $H_a$ will state that $H_0$ is not true, i.e., that at least one $p_i$ is different from the value $p_{i0}$ claimed under the null $H_0$. 

Provided the null hypothesis in \@ref(eq:null-multinomial) is true, the expected values \@ref(eq:mean-count-multinomial) can be written in terms of the expected frequencies,
\begin{equation*}
 \E[N_i] = m p_{i0}\,, \quad i=1,\dots,k\,.
\end{equation*}
Often the $n_i$, referred to as the **observed cell counts**, and the corresponding $m p_{i0}$, referred to as the **expected cell counts**, are tabulated, for example, as in Table \@ref(tab:cell-counts).   

<table>
<caption>(\#tab:cell-counts)Observed and expected cell counts.</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> Category </th>
   <th style="text-align:center;"> $i=1$ </th>
   <th style="text-align:center;"> $i=2$ </th>
   <th style="text-align:center;"> $\cdots$ </th>
   <th style="text-align:center;"> $i=k$ </th>
   <th style="text-align:center;"> Row total </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> Observed </td>
   <td style="text-align:center;"> $n_1$ </td>
   <td style="text-align:center;"> $n_2$ </td>
   <td style="text-align:center;"> $\cdots$ </td>
   <td style="text-align:center;"> $n_k$ </td>
   <td style="text-align:center;"> $m$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Expected </td>
   <td style="text-align:center;"> $mp_{10}$ </td>
   <td style="text-align:center;"> $mp_{20}$ </td>
   <td style="text-align:center;"> $\cdots$ </td>
   <td style="text-align:center;"> $mp_{k0}$ </td>
   <td style="text-align:center;"> $m$ </td>
  </tr>
</tbody>
</table>

The test procedure assesses the discrepancy between the value of the observed and expected cell counts. This discrepancy, or **goodness of fit**, is measured by the squared deviations divided by the expected count.^[The division by the expected cell counts is to account for possible differences in the relative magnitude of the observed/expected counts.]

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:multinomial-experiment"><strong>(\#thm:multinomial-experiment) </strong></span>For $m p_i \geq 5$ for $i = 1, \dots, k$, the rv
\begin{equation*}
 V = \sum_{i=1}^k \frac{(N_i - m p_i)^2}{m p_i} \quad \sim \chi^2(k-1)\,,
\end{equation*}
that is, $V$ has approximately a $\chi^2$ distribution with $\nu = k-1$ df. </div>\EndKnitrBlock{theorem}

\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:htest-multinomial"><strong>(\#prp:htest-multinomial) </strong></span>For the null hypothesis 
\begin{equation*}
H_0 : p_1 = p_{10}, p_2 = p_{20}, \cdots, p_k = p_{k0}\,,
\end{equation*}
and alternative 
\begin{equation*}
H_a : p_i \neq p_{i0}\; \text{for at least one}\; i\,,
\end{equation*}
the test statistic to consider is:
\begin{equation*}
 V = \sum_{i=1}^k \frac{(n_i - m p_{i0})^2}{m p_{i0}}\,,
\end{equation*}
provided, as a rule of thumb, $m p_{i0} \geq 5$ for all $i = 1, \dots, k$. </div>\EndKnitrBlock{proposition}

>  ⚠️  Things are much more complicated if the category probabilities are not completely specified.   


## Test for independence of factors

In Section \@ref(goodness-of-fit-tests) we considered the categorization of a population into a single factor. We now consider a single population where each individual is categorized into two factors with $I$ distinct categories for the first factor and $J$ distinct categories for the second factor. That is, each individual from the population belongs to exactly one of the $I$ categories of the first factor and exactly one of the $J$ categories of the second factor. We want to determine whether or not there is any dependency between the two factors. 

For a sample of $m$ individuals, we denote by $n_{ij}$ the count of the $m$ samples that fall both in category $i$ of the first factor and category $j$ of the second factor, for $i = 1, \dots, I$ and $j = 1, \dots, J$. A **contingency (data) table** with $I$ rows and $J$ columns (i.e., $IJ$ cells) will be used to record the $n_{ij}$ counts (in the obvious way).^[Contingency is another word for dependency in this context.] Let $p_{ij}$ be the proportion of individuals in the population who belong in category $i$ of factor 1 and category $j$ of factor $2$. Then, the probability that a randomly selected individual falls in category $i$ of factor 1 is found by summing over all $j$:
\begin{equation*}
p_{i} = \sum_{j=1}^J p_{ij}\,,
\end{equation*}
and likewise, the probability that a randomly selected individual falls in category $j$ of factor 2 is found by summing over all $i$:
\begin{equation*}
p_{j} = \sum_{i=1}^I p_{ij}\,.
\end{equation*}
The null hypothesis that we will be interested in adopting is
\begin{equation*}
H_0 : p_{ij} = p_{i} \cdot p_{j} \; \forall (i,j)\,,
 (\#eq:null-two-factor)
\end{equation*}
that is, that an individual's category in factor 1 is independent of the category in factor 2. 

Following the same program as for the single category goodness-of-fit test, we note that, assuming the null hypothesis \@ref(eq:null-two-factor) is true, then the expected count in cell $i,j$ is
\begin{equation*}
 \E[N_{ij}] = n p_{ij} = m p_{i} p_{j}\,;
\end{equation*}
and we estimate $p_i$ and $p_j$ by the appropriate sample proportion:
\begin{equation*}
\widehat{p}_i = \frac{n_i}{m}\,, \quad n_i = \sum_{j} n_{ij} \qquad \text{(row total)}\,,
\end{equation*}
and 
\begin{equation*}
\widehat{p}_j = \frac{n_j}{m}\,, \quad n_j = \sum_{i} n_{ij}\qquad \text{(col total)}\,.
\end{equation*}
Thus, the expected cell count is given by
\begin{equation*}
\widehat{e}_{ij} = m \widehat{p}_i \widehat{p}_j = \frac{n_i n_j}{m}\,,
\end{equation*}
and we assess the goodness of fit between the observed cell count $n_ij$ and the expected cell count $\widehat{e}_ij$.


\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:independence-test"><strong>(\#prp:independence-test) </strong></span>Null hypothesis $H_0 : p_{ij} = p_i p_j$ for all $i=1, \dots, I$, $j=1, \dots, J$. 
Alternative hypothesis $H_a : H_0 \;\text{is not true}$. 
Test statistic:
\begin{equation*}
V = \sum_{i=1}^I \sum_{j=1}^J \frac{(n_{ij} - \widehat{e}_{ij})^2}{\widehat{e}_{ij}}
\end{equation*}
Rule of thumb, $\widehat{e}_{ij} \geq 5$ for all $i,j$, and when $H_0$ is true then the test statistic has approximately $\chi^2((I-1)(J-1))$ distribution. Upper tail. </div>\EndKnitrBlock{proposition}


