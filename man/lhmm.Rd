% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lhmm_mmle.R
\name{lhmm}
\alias{lhmm}
\title{MMLE of LHMM}
\usage{
lhmm(action_seqs, K, paras, n_pts = 100, verbose = TRUE, ...)
}
\arguments{
\item{action_seqs}{a list of \code{n} action sequences}

\item{K}{number of hidden states}

\item{paras}{a list of elements named \code{para_a}, \code{para_b}, \code{para_alpha}, \code{para_beta}, and \code{para_P1},
providing initial values of model parameters}

\item{n_pts}{number of quadrature points}

\item{verbose}{logical. If \code{TRUE}, progress messages are printed.}

\item{...}{additional arguments passed to \code{\link{optim}}}
}
\value{
A list containing the following elements
\tabular{ll}{
\code{seqs} \tab action sequences coded in integers \cr
\tab \cr
\code{K} \tab number of hidden states \cr
\tab \cr
\code{N} \tab number of distinct actions \cr
\tab \cr
\code{paras_init} \tab a list containing initial values of parameters \cr
\tab \cr
\code{paras_est} \tab a list containing parameter estimates \cr
\tab \cr
\code{theta_est} \tab a vector of length \code{n}. estimated latent traits \cr
\tab \cr
\code{init_mllh} \tab initial value of the marginalized likelihood function \cr
\tab \cr
\code{opt_mllh} \tab maximized marginalized likelihood function \cr
\tab \cr
\code{opt_res} \tab object returned by \code{\link{optim}} \cr
}
}
\description{
Maximum marginalized likelihood estimation of LHMM.
Marginalization over latent trait is computed numerically using Guassian-Hermite quadratures from \code{\link{statmod}}.
Optimization is performed through \code{\link{optim}}.
}
\examples{
# generate data
paras_true <- sim_lhmm_paras(5, 2)
sim_data <- sim_lhmm(10, paras_true, 3, 5)
# randomly initialize parameters
paras_init <- sim_lhmm_paras(5, 2)
# fit model
lhmm_res <- lhmm(sim_data$seqs, 2, paras_init)

}
