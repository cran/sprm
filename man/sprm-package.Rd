\name{sprm-package}
\alias{sprm-package}
\alias{sprm}
\docType{package}
\title{
Sparse and Non-Sparse Partial Robust M Regression and Classification
}
\description{
Robust dimension reduction methods for regression and discriminant analysis are implemented that yield estimates with a partial least squares alike interpretability. Partial robust M regression (PRM) is robust to both vertical outliers and leverage points. Sparse partial robust M regression (SPRM) is a related robust method with sparse coefficient estimate, and therefore with intrinsic variable selection. For bianry classification related discriminant methods are PRM-DA and SPRM-DA.
}
\details{
\tabular{ll}{
Package: \tab sprm\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2014-12-10 \cr
License: \tab GPL(>=3)\cr
}
The main functions in this package are \code{prms} and \code{sprms} for non-spares and sparse partial robust M regression, respectively, and \code{prmda} and \code{sprmda} for non-spares and sparse partial robust M discriminant analysis. Further cross validation procedures for tuning parameter selection are implemented in \code{prmsCV}, \code{sprmsCV}, \code{prmdaCV} and \code{sprmdaCV}. Various plot options are available to visualize the results.
}
\author{
Sven Serneels, BASF Corp and Irene Hoffmann
}
\references{
Hoffmann, I., Serneels, S.,  Filzmoser, P. Croux, C., Sparse partial robust M regression. Chemometrics and Intelligent Laboratory Systems. In print.

Hoffmann, I., Filzmoser, P., Serneels, S., Varmuza, K., Sparse and robust PLS for binary classification.

Serneels, S., Croux, C., Filzmoser, P., Van Espen, P.J., Partial Robust M-Regression. Chemometrics and Intelligent Laboratory Systems, 79 (2005), 55-64.
}

\keyword{ package }
\seealso{
\code{\link{prms}}, \code{\link{sprms}},  \code{\link{prmda}},  \code{\link{sprmda}}
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
