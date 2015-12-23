\name{summary.prm}
\alias{summary.prm}
\alias{print.prm}
\title{
Summary of a prm model
}
\description{
Summarizing models of class prm. 
}
\usage{
\method{summary}{prm}(object, ...)
\method{print}{prm}(x, ...)
}
\arguments{
  \item{object, x}{
object of class prm
}
\item{...}{
optional arguments for internal print function.
}
}
\value{
\code{summary} prints model parameters and explained variances.

\code{print} prints model parameters.
}
\references{
Hoffmann, I., Serneels, S., Filzmoser, P., Croux, C. (2015). Sparse partial robust M regression. Chemometrics and Intelligent Laboratory Systems, 149, 50-59.

Serneels, S., Croux, C., Filzmoser, P., Van Espen, P.J. (2005). Partial Robust M-Regression. Chemometrics and Intelligent Laboratory Systems, 79, 55-64.
}
\author{
Irene Hoffmann
}
\seealso{
\code{\link{prms}}
}
\examples{
set.seed(5023)
U <- c(rep(2,20), rep(5,30))
X <- replicate(6, U+rnorm(50))
beta <- c(rep(1, 3), rep(-1,3))
e <- c(rnorm(45,0,1.5),rnorm(5,-20,1))
y <- X\%*\%beta + e
d <- as.data.frame(X)
d$y <- y
mod <- prms(y~., data=d, a=2, fun="Hampel")
summary(mod)
}
