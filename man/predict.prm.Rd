\name{predict.prm}
\alias{predict.prm}
\title{
Predict method for models of class prm
}
\description{
Predictions from a partial robust M regression model.
}
\usage{
\method{predict}{prm}(object, newdata, ...)
}
\arguments{
  \item{object}{
object of class prm.
}
  \item{newdata}{
optional data frame with new observations.
}
  \item{...}{
further arguments. Currently not used.
}
}
\details{
If \code{newdata} is specified the prm model is used to predict the fitted values for this data set, otherwise the fitted values of the model are returned.
}
\value{
\code{predict.prm} returns a vector of the predicted response. 
}
\references{
Hoffmann, I., Serneels, S., Filzmoser, P., Croux, C. (2015). Sparse partial robust M regression. Chemometrics and Intelligent Laboratory Systems, 149, 50-59.

Serneels, S., Croux, C., Filzmoser, P., Van Espen, P.J. (2005). Partial Robust M-Regression. Chemometrics and Intelligent Laboratory Systems, 79, 55-64.
}
\author{
Sven Serneels, BASF Corp and Irene Hoffmann
}
\seealso{
\code{\link{prms}}, \code{\link{prmsCV}}
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

dnew <- as.data.frame(replicate(6, U+rnorm(10)))
ynewp <- predict(mod, newdata=dnew)

}
