

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\E}{\operatorname{E}}
\newcommand{\se}{\mathsf{se}}

# Inferences based on two samples {#inference-two-samples}

We consider inferences---estimators, confidence intervals, and hypothesis testing---for comparing means, proportions, and variances based on two independent samples from different populations, respectively, in Sections \@ref(compare-means), \@ref(compare-proportions), \@ref(compare-variances). We also consider inferences when the samples are not independent, so-called paired samples, in Section \@ref(compare-paired-samples). 

## Comparing means {#compare-means}

Let us assume that we have two normal populations with iid samples 
\begin{equation*}
 X_1, \dots, X_m \sim \mathcal{N}(\mu_X, \sigma_X^2)
\end{equation*}
and 
\begin{equation*}
 Y_1, \dots, Y_n \sim \mathcal{N}(\mu_Y, \sigma_Y^2)
\end{equation*}
and, moreover, that the $X$ and $Y$ samples are independent of one another. When comparing the means of  two populations, the quantity of interest is the difference: $\mu_X - \mu_Y$. 

\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:qoi-diff-pop-means"><strong>(\#prp:qoi-diff-pop-means) </strong></span>If we consider the sample means $\overline{X}$ and $\overline{Y}$, then the mean of the variable $\overline{X} - \overline{Y}$ is,
\begin{equation*}
 \mu_{\overline{X} - \overline{Y}} 
= \E \left[ \overline{X} - \overline{Y} \right] = \mu_X - \mu_Y\,,
\end{equation*}
and the variance is,
\begin{equation*}
 \sigma_{\overline{X} - \overline{Y}}^2
= \Var \left[ \overline{X} - \overline{Y} \right]
= \frac{\sigma_X^2}{m} + \frac{\sigma_Y^2}{n} \,.
\end{equation*}</div>\EndKnitrBlock{proposition}

Proposition \@ref(prp:qoi-diff-pop-means) follows directly from the definition of the sample mean in \@ref(eq:sample-mean) and properties of expectation and variance. If our parameter of interest is \begin{equation*}
 \theta = \mu_1 - \mu_2\,,
\end{equation*}
then its estimator,
\begin{equation*}
 \widehat{\theta} = \overline{X} - \overline{Y}\,,
\end{equation*}
is normally distributed with mean and variance given by Proposition \@ref(prp:qoi-diff-pop-means). If the samples sizes $m$ and $n$ are large, then the estimator is approximately normally distributed by the Central Limit Theorem regardless of the population. We now discuss CIs and hypothesis tests for comparing population means $\theta = \mu_X - \mu_Y$. The development largely reflects that of Section \@ref(estimating-means):  

1. [Comparing means of normal populations when the variances $\sigma_X^2$ and $\sigma_Y^2$ are known](#compare-means-normpops-vars-known),
2. [Comparing means of any populations with unknown variances $\sigma_X^2$ and $\sigma_Y^2$, when the sample sizes $m$ and $n$ are large](#compare-means-large-samples),
3. [Comparing means of normal populations when the variances $\sigma_X^2$ and $\sigma_Y^2$ are unknown, when the sample sizes $m$ and $n$ are small](#compare-means-normpops-vars-unknown).


### Comparing means of normal populations when variances are known {#compare-means-normpops-vars-known}

When $\sigma_X^2$ and $\sigma_Y^2$ are known, standardizing $\overline{X} - \overline{Y}$ yields the standard normal variable:
\begin{equation}
 Z = \frac{\overline{X} - \overline{Y} - (\mu_X - \mu_Y)}{\sqrt{\frac{\sigma_X^2}{m} + \frac{\sigma_Y^2}{n}}}\quad \sim \mathcal{N}(0,1)\,.
 (\#eq:compare-means-standard-trans)
\end{equation}  
Inferences proceed by treating the parameter of interest $\theta$ as a single sample using \@ref(eq:compare-means-standard-trans).  

\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:ci-compare-means-normpops-vars-known"><strong>(\#prp:ci-compare-means-normpops-vars-known) </strong></span>A $100(1-\alpha)\%$ CI for the parameter $\theta = \mu_X - \mu_Y$ based on samples of size $m$ from a normal population $\mathcal{N}(\mu_X, \sigma_X^2)$ and of size $n$ from $\mathcal{N}(\mu_Y, \sigma_Y^2)$  with known variances, is given by
\begin{equation*}
 (\overline{x} + \overline{y}) \pm z_{\alpha/2} 
 \cdot \sqrt{\frac{\sigma_X^2}{m} + \frac{\sigma_Y^2}{n}} \,.
\end{equation*}</div>\EndKnitrBlock{proposition}


\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:htest-compare-means-normpops-vars-known"><strong>(\#prp:htest-compare-means-normpops-vars-known) </strong></span>For null hypothesis $H_0 : \mu_X - \mu_Y = \theta_0$, the test statistic to consider is:
\begin{equation*}
 z = \frac{\overline{x} - \overline{y} - \theta_0}{\sqrt{\frac{\sigma_X^2}{m} + \frac{\sigma_Y^2}{n}}}
\end{equation*}</div>\EndKnitrBlock{proposition}

### Comparing means when the sample sizes are large {#compare-means-large-samples}

When the samples are large, then the assumptions about normality of the populations and knowledge of the variances $\sigma_X^2$ and $\sigma_Y^2$ can be relaxed. For sufficiently large $m$ and $n$, the difference of the sample means, $\overline{X} - \overline{Y}$, has approximately a normal distribution for any underlying population distributions by the Central Limit Theorem. Moreover, if $m$ and $n$ are large enough, then replacing the population variances with the sample variances $S_X^2$ and $S_Y^2$ will not increase the variability of the estimator or the test statistic too much. 

\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:ci-compare-means-large-samples"><strong>(\#prp:ci-compare-means-large-samples) </strong></span>For $m$ and $n$ sufficiently large, an approximate $100(1-\alpha)\%$ CI for $\mu_X - \mu_Y$ for two samples from populations with any underlying distribution is given by
\begin{equation*}
 (\overline{x} + \overline{y}) \pm z_{\alpha/2} 
 \cdot \sqrt{\frac{s_{X}^2}{m} + \frac{s_{Y}^2}{n}}
\end{equation*}</div>\EndKnitrBlock{proposition}

\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:htest-compare-means-large-samples"><strong>(\#prp:htest-compare-means-large-samples) </strong></span>For null hypothesis $H_0 : \mu_X - \mu_Y = \theta_0$, the test statistic to consider is:
\begin{equation*}
 z = \frac{\overline{x} - \overline{y} - \theta_0}{\sqrt{\frac{s_{X}^2}{m} + \frac{s_{Y}^2}{n}}}
\end{equation*}</div>\EndKnitrBlock{proposition}

### Comparing means of normal populations when variances are unknown and the sample size is small {#compare-means-normpops-vars-unknown}

If $\sigma_X$ and $\sigma_Y$ are unknown and either sample is small (e.g., $m < 30$ or $n <30$), but both populations are normally distributed, then we can use Student's $t$ distribution to make inferences. We provide the following theorem without proof.  

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:dist-t-compare-means-normpops"><strong>(\#thm:dist-t-compare-means-normpops) </strong></span>When both population distributions are normal, the standardized variable 
\begin{equation*}
T = \frac{\overline{X}-\overline{Y} - (\mu_X - \mu_Y)}{\sqrt{\frac{S_X^2}{m} + \frac{S_Y^2}{n}}} 
\quad \sim t(\nu)
\end{equation*}
where the df $\nu$ is estimated from the data. Namely, $\nu$ is given by (round $\nu$ down to the nearest integer):
\begin{equation}
 \nu = \frac{ \left( \frac{s_X^2}{m} + \frac{s_Y^2}{n} \right)^2}{\frac{(s_X^2 / m)^2}{m-1} + \frac{(s_Y^2/n)^2}{n-1}} 
 = \frac{ \left( s_{\overline{X}}^2 + s_{\overline{Y}}^2 \right)^2}{\frac{s_{\overline{X}}^4}{m-1} + \frac{s_{\overline{Y}}^4}{n-1}}
 (\#eq:dist-t-compare-means-normpops-nu)
\end{equation}
where $s_X^2$ and $s_Y^2$ are point estimators of the sample variances; alternatively, we see that the formula \@ref(eq:dist-t-compare-means-normpops-nu) can also be written in terms of the standard error of the sample means:
\begin{equation*}
 s_{\overline{X}} = \frac{s_X}{\sqrt{m}} 
 \quad \text{and} \quad \qquad 
 s_{\overline{Y}} = \frac{s_Y}{\sqrt{n}} \,.
\end{equation*}</div>\EndKnitrBlock{theorem}

The formula \@ref(eq:dist-t-compare-means-normpops-nu) for the data-driven choice of $\nu$ calls for the computation of the standard error of the sample means. 

\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:ci-compare-means-normpops-vars-unknown"><strong>(\#prp:ci-compare-means-normpops-vars-unknown) </strong></span>A $100(1-\alpha)\%$ CI for $\mu_X - \mu_Y$ for two samples of size $m$ and $n$ from normal populations where the variances are unknown is given by 
\begin{equation*}
 (\overline{x} - \overline{y}) \pm t_{\alpha/2, \nu} \sqrt{ \frac{s_X^2}{m} + \frac{s_Y^2}{n}}\,,
\end{equation*}
where we recall that $t_{\alpha/2, \nu}$ is the $\alpha/2$ critical value of the $t$ distribution with $\nu$ given by \@ref(eq:dist-t-compare-means-normpops-nu).</div>\EndKnitrBlock{proposition}


\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:htest-compare-means-normpops-vars-unknown"><strong>(\#prp:htest-compare-means-normpops-vars-unknown) </strong></span>For the null hypothesis $H_0 = \mu_X - \mu_Y = \theta_0$, the test statistic to consider is:
\begin{equation*}
t = \frac{(\overline{x} - \overline{y}) - \theta_0}{\sqrt{ \frac{s_X^2}{m} + \frac{s_Y^2}{n}}}
\end{equation*}</div>\EndKnitrBlock{proposition}

If the normal populations have the same variance (i.e., the populations differ only in *location* not in *spread*), then matters simplify. If the variances of the normal populations are unknown but are the same (i.e., $\sigma_X^2 = \sigma_Y^2$), then deriving CIs and test statistics for comparing the means can be simplified by considering a combined or pooled estimator for (the single parameter) $\sigma^2$. If we have two samples from populations with variance $\sigma^2$, then each sample provides an estimate for $\sigma^2$. That is, $S_X^2$, based on the $m$ observations of the first sample, is one estimator for $\sigma^2$ and another is given by $S_Y^2$, based on $n$ observations of the second sample. The correct way to combine these two estimators into a single estimator for the sample variance is to consider the **pooled estimator** of $\sigma^2$, 
\begin{equation}
 S_{\mathsf{p}}^2 = \frac{m-1}{m+n-2} S_X^2 + \frac{n-1}{m+n-2} S_Y^2 \,.
 (\#eq:pooled-sample-var)
\end{equation}
The pooled estimator is a weighted average that adjusts for differences between the sample sizes $m$ and $n$.^[If $m \neq n$, then the estimator with *more* samples will contain *more* information about the parameter $\sigma^2$. Thus, the simple average $(S_X^2 + S_Y^2)/2$ wouldn't really be fair, would it?]


\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:ci-compare-means-normpops-pooled"><strong>(\#prp:ci-compare-means-normpops-pooled) </strong></span>A $100(1-\alpha)\%$ CI for $\mu_X - \mu_Y$ for two samples of size $m$ and $n$ from normal populations where the variance $\sigma^2$ is unknown is given by 
\begin{equation*}
 (\overline{x} - \overline{y}) \pm t_{\alpha/2, m  + n - 2} \cdot \sqrt{ s_{\mathsf{p}}^2 \left( \frac{1}{m} + \frac{1}{n} \right)} \,,
\end{equation*}
where we recall that $t_{\alpha/2, m+n-2}$ is the $\alpha/2$ critical value of the $t$ distribution with $\nu = m + n - 2$ df. </div>\EndKnitrBlock{proposition}

Similarly, one can consider a pooled $t$ test, i.e., a hypothesis test based on the pooled estimator for the variance as opposed to the two-sample $t$ test in Proposition \@ref(prp:htest-compare-means-normpops-vars-unknown). If you have reasons to believe that $\sigma_X^2 = \sigma_Y^2$, these pooled $t$ procedures are appealing because $\nu$ is very easy to compute. 

>  ⚠️  Pooled $t$ procedures are not robust if the assumption of equalized variance is violated. Theoretically, you could first carry out a statistical test $H_0 : \sigma_X^2 = \sigma_Y^2$ on the equality of variances and then use a pooled $t$ procedure if the null hypothesis is not rejected. However, there is no free lunch: the typical $F$ test for equal variances (see Section \@ref(compare-variances)) is sensitive to normality assumptions. The two sample $t$ procedures, with the data-driven choice of $\nu$ in \@ref(eq:dist-t-compare-means-normpops-nu), are therefore recommended unless, of course, you have a very compelling reason to believe $\sigma_X^2 = \sigma_Y^2$.  


## Comparing proportions {#compare-proportions}


## Comparing variances {#compare-variances}

## Comparing paired samples {#compare-paired-samples}