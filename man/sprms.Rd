\name{sprms}
\alias{sprms}
\title{
Sparse partial robust M regression
}
\description{
Sparse partial robust M regression for models with univariate response. 
This method for dimension reduction and regression analysis yields estimates with a partial least squares alike interpretability that are both sparse and robust to both vertical outliers and leverage points. The sparsity is tuned with an L1 penalty. 
}
\usage{
sprms(formula, data, a, eta, fun = "Hampel", probp1 = 0.95, hampelp2 = 0.975,
hampelp3 = 0.999, center = "median", scale = "qn", print = FALSE, 
numit = 100, prec = 0.01)
}
\arguments{
  \item{formula}{
an object of class formula.
}
  \item{data}{
a data frame which contains the variables given in formula or a list of two elements, where the first element is the response vector and the second element is a matrix of the explanatory variables.
}
  \item{a}{
the number of SPRMS components to be estimated in the model.
}
  \item{eta}{
a tuning parameter for the sparsity with 0\\le eta<1.
}
  \item{fun}{
an internal weighting function for case weights. Choices are \code{"Hampel"} (preferred), \code{"Huber"} or \code{"Fair"}.
}
  \item{probp1}{
the 1-alpha value at which to set the first outlier cutoff for the weighting function.
}
  \item{hampelp2}{
the 1-alpha values for second cutoff. Only applies to \code{fun="Hampel"}.
}
  \item{hampelp3}{
the 1-alpha values for third cutoff. Only applies to \code{fun="Hampel"}.
}
  \item{center}{
type of centering of the data in form of a string that matches an R function, e.g. \code{"mean"} or \code{"median"}.
}
  \item{scale}{
type of scaling for the data in form of a string that matches an R function, e.g. \code{"sd"} or \code{"qn"} or alternatively \code{"no"} for no scaling.
}
  \item{print}{
logical, default is \code{FALSE}. If \code{TRUE} the variables included in each component are reported.
}
  \item{numit}{
the maximum number of iterations for the convergence of the coefficient estimates.
}
  \item{prec}{
a value for the precision of estimation of the coefficients.
}
}
\details{
The NIPLS algorithm with a L1 sparsity constrained combined with weighted regression is used for the model estimation.

\code{a} is the number of components in the model. Note that it is not possible to simply reduce the number of weighting vectors to obtain a model with a smaller number of components. Each model has to be estimated separately due to its dependence on robust case weights.
}
\value{
sprms returns an object of class sprm.

Functions \code{summary}, \code{predict} and \code{plot} are available. Also the generic functions \code{coefficients}, \code{fitted.values} and \code{residuals} can be used to extract the corresponding elements from the sprm object.

\item{coefficients}{vector of coefficients of the weighted regression model.}
\item{intercept}{intercept of weighted regression model.}
\item{wy}{the case weights in the y space.}
\item{wt}{the case weights in the score space.}
\item{w}{the overall case weights used for weighted regression (depending on the weight function). \code{w=wy*wt}.}
\item{scores}{the matrix of scores.}
%\item{weighting.vectors}{the matrix to transform data to scorse.}
\item{R}{Direction vectors (or weighting vectors or rotation matrix) to obtain the scores. \code{scores=Xs\%*\%R}.}
\item{loadings}{the matrix of loadings.}
\item{fitted.values}{the vector of estimated response values.}
\item{residuals}{vector of residuals, true response minus estimated response.}
\item{coefficients.scaled}{vector of coefficients of the weighted regression model with scaled data.}
\item{intercept.scaled}{intercept of weighted regression model with scaled data.}
\item{YMeans}{value used internally to center response.}
\item{XMean}{vector used internally to center data.}
\item{Xscales}{vector used internally to scale data.}
\item{Yscales}{value used internally to scale response.}
\item{Yvar}{percentage of contribution for each component to the explanation of the variance of the response.}
\item{Xvar}{percentage of contribution for each component to the explanation of the variance of the variables.}
\item{inputs}{list of inputs: parameters, data and scaled data.}
\item{used.vars}{Indices of variables included in the model.}
}
\references{
Hoffmann, I., Serneels, S., Filzmoser, P., Croux, C. (2015). Sparse partial robust M regression. Chemometrics and Intelligent Laboratory Systems, 149, 50-59.

Serneels, S., Croux, C., Filzmoser, P., Van Espen, P.J. (2005). Partial Robust M-Regression. Chemometrics and Intelligent Laboratory Systems, 79, 55-64.
}
\author{
Sven Serneels, BASF Corp and Irene Hoffmann
}
\seealso{
\code{\link{sprmsCV}}, \code{\link{plot.sprm}}, \code{\link{biplot.sprm}}, \code{\link{predict.sprm}}, \code{\link{prms}}
}
\examples{

set.seed(50235)
U1 <- c(rep(3,20), rep(4,30))
U2 <- rep(3.5,50)
X1 <- replicate(5, U1+rnorm(50))
X2 <- replicate(20, U2+rnorm(50))
X <- cbind(X1,X2)
beta <- c(rep(1, 5), rep(0,20))
e <- c(rnorm(45,0,1.5),rnorm(5,-20,1))
y <- X\%*\%beta + e
d <- as.data.frame(X)
d$y <- y
mod <- sprms(y~., data=d, a=1, eta=0.5, fun="Hampel")
sprmfit <- predict(mod)

plot(y,sprmfit, main="SPRM")
abline(0,1)

}
