

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\E}{\operatorname{E}}
\newcommand{\se}{\mathsf{se}}

# Inferences based on a single sample {#inference-single-sample}

We estimate population means ($\mu$) in Section \@ref(estimating-means), population proportions ($p$) in Section \@ref(estimating-proportions), and population variances ($\sigma^2$) in Section \@ref(estimating-variances).  

## Estimating means {#estimating-means}

If the parameter of interest is the population mean $\theta = \mu$, then the sample mean estimator $\widehat{\theta} = \overline{X}$ in \@ref(eq:sample-mean) has (at least approximately) a normal distribution for sufficiently large $n$. We will consider three cases,

1. [normal population with known $\sigma^2$](#mean-normal-var-known),
2. [any population with unknown $\sigma^2$, when the sample size $n$ is large](#mean-large-sample),
3. [normal population with unknown $\sigma^2$, when the sample size $n$ is small](#mean-normal-var-unknown),  

where the form of the confidence interval for $mu$ can be derived using the approximate normality of the sample mean.

In general, the confidence intervals for the mean based on normality theory will have the form:
\begin{equation}
\text{point estimate}\; \mu \pm (\text{critical value of reference dist.}) \cdot (\text{precision of point estimate})\,, (\#eq:ci-gen-form)
\end{equation}
where the reference distribution will be the standard normal (for 1. and 2.) and the Student's $\mathsf{t}$ distribution (for 3.). The critical value corresponds to the two-sided (symmetric) tail areas under the reference distribution.  

### Mean of a normal population with known variance {#mean-normal-var-known}

\BeginKnitrBlock{definition}<div class="definition"><span class="definition" id="def:ci-norm-known-var"><strong>(\#def:ci-norm-known-var) </strong></span>A **$100(1-\alpha)\%$ confidence interval** for the mean $\mu$ of a normal population when the value of $\sigma^2$ is known is given by 
\begin{equation} 
 \left(\overline{x} - z_{\alpha/2} \cdot \frac{\sigma}{\sqrt{n}}\,, 
        \overline{x} + z_{\alpha/2} \cdot \frac{\sigma}{\sqrt{n}} \right)\,,  (\#eq:ci-norm-known-var)
\end{equation}
or $\overline{x} \pm z_{\alpha/2} \cdot \sigma / \sqrt{n}$. </div>\EndKnitrBlock{definition}

The CI for the mean \@ref(eq:ci-norm-known-var) can be expressed as 
\begin{equation*}
 \text{point estimate}\; \mu \pm 
 (z \;\text{critical value}) \cdot (\text{standard error of mean})\,.
\end{equation*}
The $z$ critical value is related to the tail areas under the standard normal curve; we need to find the $z$-score having a cumulative probability equal to $1-\alpha$ according to Definition \@ref(def:confidence-interval-gen). 

**TODO**: add example 

As noted in \@ref(eq:ci-gen-form) and \@ref(eq:ci-norm-known-var), the width of a CI is related to the estimator's precision. The confidence level (or reliability) is inversely related to this precision. When the population is normal and the variance is known, then an appealing strategy is to determine the sample size necessary to achieve a desired confidence level and precision. A general formula for the sample size $n$ necessary to achieve an interval width $w$ is obtained at confidence level  $\alpha$ is obtained by equating $w$ to $2z_{\alpha/2} \cdot \sigma /\sqrt{n}$ and then solving for $n$. 

\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:ci-select-n-fixed-w-alpha"><strong>(\#prp:ci-select-n-fixed-w-alpha) </strong></span>The sample size $n$ required to achieve a CI for $\mu$ with width $w$ at level $\alpha$ is given by,
\begin{equation}
n = \left( 2 z_{\alpha/2} \cdot \frac{\sigma}{w} \right)^2 \,.
\end{equation}</div>\EndKnitrBlock{proposition}
From Proposition \@ref(prp:ci-select-n-fixed-w-alpha), we see that the smaller the desired $w$ then the larger $n$ must be (and subsequently, the more effort that must be allocated to data collection).

**TODO**: add example of sample size calculation

### Mean of a population with unknown variance (large-sample) {#mean-large-sample}

Consider samples $X_1, \dots, X_n$ from a population with mean $\mu$ and variance $\sigma^2$. Provided that $n$ is large enough, the Central Limit Theorem implies that the estimator for the sample mean $\overline{X}$ in \@ref(eq:sample-mean) has *approximately* a normal distribution. Then 
\begin{equation}
P \left( - z_{\alpha/2} < \frac{\overline{X} - \mu}{\sigma/\sqrt{n}} < z_{\alpha/2} \right) \approx 1 - \alpha\,,
\end{equation}
since the transformed variable has approximately a standard normal distribution. Thus, computing a point estimate based on a large $n$ of samples yields a CI for the population parameter $\mu$ at an *approximate* confidence level $\alpha$. However, it is often the case that the variance is unknown. When $n$ is large, replacing the population variance $\sigma^2$ by the sample variance $S^2$ in \@ref(eq:sample-var) will not typically introduce too much additional variability.

\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:ci-large-sample"><strong>(\#prp:ci-large-sample) </strong></span>For large samples $n$, an approximate $100(1-\alpha)\%$ confidence interval for the mean $\mu$ of any population when the variance is uknown is given by 
\begin{equation} 
 \left(\overline{x} - z_{\alpha/2} \cdot \frac{s}{\sqrt{n}} \,, 
        \overline{x} + z_{\alpha/2} \cdot \frac{s}{\sqrt{n}} \right)\,,  
 (\#eq:ci-large-sample)
\end{equation}
or $\overline{x} \pm z_{\alpha/2} \cdot s / \sqrt{n}$. </div>\EndKnitrBlock{proposition}

The CI for the mean \@ref(eq:ci-large-sample) applies regardless of the shape of the population distribution so long as the number of samples is large. A rule of thumb is that $n > 40$ is sufficient. In words, the CI \@ref(eq:ci-large-sample) can be expressed as 
\begin{equation*}
 \text{point estimate}\; \mu \pm 
 (z \;\text{critical value}) \cdot (\text{estimated standard error of mean})\,.
\end{equation*}
Typically, a large-sample CI for a general parameter $\theta$ similar to \@ref(eq:ci-large-sample) holds for any estimator $\widehat{\theta}$ that satisfies: (1) approximately normal in distribution, (2) approximately unbiased, and (3) an expression for the standard error is available.

**TODO**: add example 

### Mean of a normal population with unknown variance {#mean-normal-var-unknown}

In Section \@ref(mean-normal-var-known), we considered samples $X_1, \dots, X_n$ from a normal population with a known $\mu$ and $\sigma^2$. In contrast, here we consider samples from a normal population and assume the population parameters $\mu$ and $\sigma^2$ are unknown. If the number of samples is large, the discussion in Section \@ref(mean-large-sample) indicates that the rv $Z = (\overline{X} - \mu) \sqrt{n} / S$ has approximately a standard normal distribution. However, if $n$ is not sufficiently large then the transformed variable will be more spread out than a standard normal distribution. 

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:sample-mean-t-dist"><strong>(\#thm:sample-mean-t-dist) </strong></span>For the sample mean $\overline{X}$ based on $n$ samples from a normal distribution with mean $\mu$, the rv
\begin{equation}
 T = \frac{\overline{X} - \mu}{S} \sqrt{n} \quad \sim \mathsf{t}(n-1)\,,
\end{equation}
that is, $T$ has Student's $\mathsf{t}$ distribution with $\nu = n-1$ degrees of freedom (df). </div>\EndKnitrBlock{theorem}

This leads us to consider a CI for the population parameter $\mu$ that is based on critical values of the $\mathsf{t}$ distribution. 

\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:ci-norm-unknown-var"><strong>(\#prp:ci-norm-unknown-var) </strong></span>A **$100(1-\alpha)\%$ confidence interval** for the mean $\mu$ of a normal population when the value of $\sigma^2$ is unknown is given by 
\begin{equation} 
 \left(\overline{x} - t_{\alpha/2, n-1} \cdot \frac{s}{\sqrt{n}}\,, 
        \overline{x} + t_{\alpha/2, n-1} \cdot \frac{s}{\sqrt{n}} \right)\,,  (\#eq:ci-norm-known-var)
\end{equation}
or $\overline{x} \pm t_{\alpha/2, n-1} \cdot s/ \sqrt{n}$. Here $\overline{x}$ and $s$ are the sample mean and sample standard deviation, respectively.</div>\EndKnitrBlock{proposition}

In contrast to Proposition \@ref(prp:ci-select-n-fixed-w-alpha), it is difficult to select the sample size $n$ to control the width of the $\mathsf{t}$-based CI as the width involves the unknown (before the sample is acquired) $s$ and because $n$ also enters through $t_{\alpha/2, n-1}$.  

**TODO**: add example 
 
\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:norm-ci-rule-thumb"><strong>(\#prp:norm-ci-rule-thumb) </strong></span>**TODO**: rule of thumb normal CI</div>\EndKnitrBlock{proposition}

**TODO**: add example using rule of thumb


## Estimating proportions {#estimating-proportions}

Consider a population of size $N$ in which a proportion $p$ of the population satisfies a given property. The $p \in (0,1)$ is a parameter characterizing the population, with distribution $F(p)$,^[Here we write $F$ for a general distribution, but what special distribution might this be?] that we might be interested in estimating. A sample, $X_1, \dots, X_n \sim F(p)$, of size $n$ from the population contains a proportion,
\begin{equation}
 \widehat{p} = \frac{1}{n} \sum_{i=1}^n X_i\,,
 (\#eq:proportion-estimator)
\end{equation}
satisfying the given property. The estimator $\widehat{p}$ varies with the sample and for large $n$ it's sampling distribution has the following properties:
\begin{equation*}
\mu_{\widehat{p}} = \E[X_i] = p 
 (\#eq:proportion-mean)
\end{equation*}
and 
\begin{equation}
 \sigma_{\widehat{p}}^2 = \frac{\Var[X_i]}{n} = \frac{p(1-p)}{n}\,,
 (\#eq:proportion-var)
\end{equation}
provided that $n$ is small relative to $N$ (a rule of thumb is $n \leq 0.05 N$).^[Note that if $n$ is large relative to $N$ ($n > 0.05 N$) then the variance \@ref(eq:proportion-var) must be adjusted by a factor (related to the hypergeometric distribution):
\begin{equation*}
 \sigma_{\widehat{p}}^2 = \frac{p(1-p)}{n} \frac{N-n}{N-1}\,,
\end{equation*}
where for fixed $n$ the factor converges to $1$ as $N\to \infty$.] Moreover, by invoking the Central Limit Theorem we have the distribution of $\widehat{p}$ is approximately normal for sufficiently large $n$ as \@ref(eq:proportion-estimator) is a sample mean. Indeed, this normal approximation works well for moderately large $n$ as long as $p$ is not too close to zero or one; a rule of thumb is that $np > 5$ and $n(1-p) > 5$.

\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:ci-proportion"><strong>(\#prp:ci-proportion) </strong></span>For large samples $n$, a $100(1-\alpha)\%$ confidence interval for the parameter $p$ is given by
\begin{equation}
 \widehat{p} \pm z_{\alpha/2} \sqrt{\frac{\widehat{p} (1-\widehat{p})}{n}}\,.
 (\#eq:proportion-mean-ci)
\end{equation}</div>\EndKnitrBlock{proposition}

This follows from Proposition \@ref(prp:ci-large-sample) by observing that \@ref(eq:proportion-estimator) is a sample mean and replacing the standard error $\sigma_{\widehat{p}}$ from \@ref(eq:proportion-var) by the estimated standard error,
\begin{equation*}
 \widehat{\se}(\widehat{p}) = \sqrt{\frac{\widehat{p} (1-\widehat{p})}{n}}\,;
\end{equation*}
recall the $s$ in \@ref(eq:ci-large-sample) is the sample variance for the *population* and $s / \sqrt{n} = \se$ is the standard error of the point estimator.

\BeginKnitrBlock{example}<div class="example"><span class="example" id="exm:eg-est-prop-norm-approx-binom"><strong>(\#exm:eg-est-prop-norm-approx-binom) </strong></span>**TODO**: Examples of sampling distribution for p $\lozenge$</div>\EndKnitrBlock{example}

\BeginKnitrBlock{example}<div class="example"><span class="example" id="exm:eg-est-prop-ci"><strong>(\#exm:eg-est-prop-ci) </strong></span>**TODO**: Example confidence interval for p $\lozenge$</div>\EndKnitrBlock{example}

\BeginKnitrBlock{example}<div class="example"><span class="example" id="exm:eg-est-prop-hypothesis-test"><strong>(\#exm:eg-est-prop-hypothesis-test) </strong></span>**TODO**: Example hypothesis test $\lozenge$</div>\EndKnitrBlock{example}

## Estimating variances {#estimating-variances}

Next we consider estimates of the population variance (and standard deviation) when the population is assumed to have a normal distribution. In this case, the sample variance $S^2$ in \@ref(eq:sample-var) provides the basis for inferences. Consider iid samples $X_1, \dots, X_n \sim \mathsf{N}(\mu, \sigma^2)$. We provide the following theorem without proof.

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:samp-var-chisq"><strong>(\#thm:samp-var-chisq) </strong></span>For the sample variance $S^2$ based on $n$ samples from a normal distribution with variance $\sigma$, the rv
\begin{equation*}
V = \frac{(n-1)S^2}{\sigma^2} = \frac{\sum_i(X_i - \overline{X})^2}{\sigma^2} \qquad \sim \chi^2_{n-1}\,,
\end{equation*}
that is, $V$ has a $\chi^2$ distribution with $\nu = n-1$ df. </div>\EndKnitrBlock{theorem}

Based on Theorem \@ref(thm:samp-var-chisq), 
\begin{equation*}
P\left(\chi^2_{1-\alpha/2, n-1} < \frac{(n-1)S^2}{\sigma^2} < \chi^2_{\alpha/2, n-1} \right) = 1 - \alpha \,,
\end{equation*}
i.e., the area captured between the right and left tail critical $\chi^2$ values is $1-\alpha$. The expression above can be further manipulated to obtain an interval for the unknown parameter $\sigma^2$:
\begin{equation*}
P\left(\frac{(n-1) s^2}{\chi^2_{\alpha/2, n-1}} < \sigma^2 < \frac{(n-1) s^2}{\chi^2_{1-\alpha/2, n-1}} \right) = 1 - \alpha \,,
\end{equation*}
where we substitute the computed value of the point estimate $s^2$ for the estimator into the limits to give a CI for $\sigma^2$. If we take square roots of the inequality above, we obtain a CI for the population standard deviation $\sigma$. 

\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:ci-variance"><strong>(\#prp:ci-variance) </strong></span>A $100(1-\alpha)\%$ confidence interval for the variance of a normal population is
\begin{equation*}
 \left( (n-1)s^2 / \chi^2_{\alpha/2, n-1} \,,  (n-1)s^2 / \chi^2_{1-\alpha/2, n-1} \right) \,.
 (\#eq:ci-variance)
\end{equation*}
A $100(1-\alpha)\%$ confidence interval for the standard deviation $\sigma$ of a normal population is given by taking the square roots of the lower and upper limits in \@ref(eq:ci-variance).</div>\EndKnitrBlock{proposition}

\BeginKnitrBlock{example}<div class="example"><span class="example" id="exm:eg-ci-variance"><strong>(\#exm:eg-ci-variance) </strong></span>**TODO**: Example CI for variance (using the tree data?) $\lozenge$</div>\EndKnitrBlock{example}
