\name{summary.sprm}
\alias{summary.sprm}
\alias{print.sprm}
\title{
Summary of a sprm model
}
\description{
Summarizing models of class sprm. 
}
\usage{
\method{summary}{sprm}(object, ...)
\method{print}{sprm}(x, ...)
}
\arguments{
  \item{object, x}{
object of class sprm.
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
\code{\link{sprms}}
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
summary(mod)
}