\name{sprm-package}
\alias{sprm-package}
\alias{sprm}
\docType{package}
\title{
Sparse and Non-Sparse Partial Robust M Regression
}
\description{
In this package two methods for dimension reduction and regression analysis are implemented that yield estimates with a partial least squares alike interpretability. Partial robust M regression is robust to both vertical outliers and leverage points. Sparse partial robust M regression is a related robust method with sparse coefficient estimate, and therefore with intrinsic variable selection.
}
\details{
\tabular{ll}{
Package: \tab sprm\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2014-12-10 \cr
License: \tab GPL(>=3)\cr
}
The main functions in this package are \code{prms} and \code{sprms} for non-spares and sparse partial robust M regression, respectively. Further cross validation procedures for tuning parameter selection are implemented in \code{prmsCV} and \code{sprmsCV}. Various plot options are available to visualize the results.
}
\author{
Sven Serneels, BASF Corp and Irene Hoffmann
}
\references{
Sven Serneels et al. (2014) Sparse partial robust M regression

Serneels, S., Croux, C., Filzmoser, P., Van Espen, P.J., Partial Robust M-Regression. Chemometrics and Intelligent Laboratory Systems, 79 (2005), 55-64.
}

\keyword{ package }
\seealso{
\code{\link{prms}}, \code{\link{sprms}}
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
mod <- prms(y~., data=d, a=2, fun="Hampel")
smod <- sprms(y~., data=d, a=2, eta=0.5, fun="Hampel")

biplot(mod)
biplot(smod)
}
