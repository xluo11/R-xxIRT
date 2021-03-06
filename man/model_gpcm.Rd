% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/module1_model_gpcm.R
\name{model_gpcm}
\alias{model_gpcm}
\alias{model_gpcm_prob}
\alias{model_gpcm_info}
\alias{model_gpcm_lh}
\alias{model_gpcm_gendata}
\alias{model_gpcm_rescale}
\alias{model_gpcm_plot}
\alias{model_gpcm_plot_loglh}
\title{Generalized Partial Credit Model}
\usage{
model_gpcm_prob(t, a, b, d, D = 1.702, insert_d0 = NULL)

model_gpcm_info(t, a, b, d, D = 1.702, insert_d0 = NULL)

model_gpcm_lh(u, t, a, b, d, D = 1.702, insert_d0 = NULL,
  log = FALSE)

model_gpcm_gendata(n_p, n_i, n_c, t = NULL, a = NULL, b = NULL,
  d = NULL, D = 1.702, sort_d = FALSE, t_dist = c(0, 1),
  a_dist = c(-0.1, 0.2), b_dist = c(0, 0.8), missing = NULL)

model_gpcm_rescale(t, a, b, d, param = c("t", "b"), mean = 0, sd = 1)

model_gpcm_plot(a, b, d, D = 1.702, insert_d0 = NULL,
  type = c("prob", "info"), by_item = FALSE, total = FALSE,
  xaxis = seq(-6, 6, 0.1))

model_gpcm_plot_loglh(u, a, b, d, D = 1.702, insert_d0 = NULL,
  xaxis = seq(-6, 6, 0.1), show_mle = FALSE)
}
\arguments{
\item{t}{ability parameters, 1d vector}

\item{a}{discrimination parameters, 1d vector}

\item{b}{item location parameters, 1d vector}

\item{d}{item category parameters, 2d vector}

\item{D}{the scaling constant, 1.702 by default}

\item{insert_d0}{insert an initial category value}

\item{u}{the observed scores (starting from 0), 2d matrix}

\item{log}{TRUE to return log-likelihood}

\item{n_p}{the number of people to be generated}

\item{n_i}{the number of items to be generated}

\item{n_c}{the number of score categories}

\item{sort_d}{\code{TRUE} to sort d parameters for each item}

\item{t_dist}{parameters of the normal distribution used to generate t-parameters}

\item{a_dist}{parameters of the lognormal distribution parameters of a-parameters}

\item{b_dist}{parameters of the normal distribution used to generate b-parameters}

\item{missing}{the proportion or number of missing responses}

\item{param}{the parameter of the new scale: 't' or 'b'}

\item{mean}{the mean of the new scale}

\item{sd}{the standard deviation of the new scale}

\item{type}{the type of plot, prob for ICC and info for IIFC}

\item{by_item}{TRUE to combine categories}

\item{total}{TRUE to sum values over items}

\item{xaxis}{the values of x-axis}

\item{show_mle}{TRUE to print maximum likelihood values}
}
\description{
Routine functions for the GPCM
}
\details{
Use \code{NA} to represent unused category.
}
\examples{
with(model_gpcm_gendata(10, 5, 3), model_gpcm_prob(t, a, b, d))
with(model_gpcm_gendata(10, 5, 3), model_gpcm_info(t, a, b, d))
with(model_gpcm_gendata(10, 5, 3), model_gpcm_lh(u, t, a, b, d))
model_gpcm_gendata(10, 5, 3)
model_gpcm_gendata(10, 5, 3, missing=.1)
# Figure 1 in Muraki, 1992 (APM)
b <- matrix(c(-2,0,2,-.5,0,2,-.5,0,2), nrow=3, byrow=TRUE)
model_gpcm_plot(a=c(1,1,.7), b=rowMeans(b), d=rowMeans(b)-b, D=1.0, insert_d0=0)
# Figure 2 in Muraki, 1992 (APM)
b <- matrix(c(.5,0,NA,0,0,0), nrow=2, byrow=TRUE)
model_gpcm_plot(a=.7, b=rowMeans(b, na.rm=TRUE), d=rowMeans(b, na.rm=TRUE)-b, D=1.0, insert_d0=0)
# Figure 3 in Muraki, 1992 (APM)
b <- matrix(c(1.759,-1.643,3.970,-2.764), nrow=2, byrow=TRUE)
model_gpcm_plot(a=c(.778,.946), b=rowMeans(b), d=rowMeans(b)-b, D=1.0, insert_d0=0)
# Figure 1 in Muraki, 1993 (APM)
b <- matrix(c(0,-2,4,0,-2,2,0,-2,0,0,-2,-2,0,-2,-4), nrow=5, byrow=TRUE)
model_gpcm_plot(a=1, b=rowMeans(b), d=rowMeans(b)-b, D=1.0)
# Figure 2 in Muraki, 1993 (APM)
b <- matrix(c(0,-2,4,0,-2,2,0,-2,0,0,-2,-2,0,-2,-4), nrow=5, byrow=TRUE)
model_gpcm_plot(a=1, b=rowMeans(b), d=rowMeans(b)-b, D=1.0, type='info', by_item=TRUE)
with(model_gpcm_gendata(5, 50, 3), model_gpcm_plot_loglh(u, a, b, d))
}
