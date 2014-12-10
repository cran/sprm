\name{predict.sprm}
\alias{predict.sprm}
\title{
Predict method for models of class sprm
}
\description{
Predictions from a sparse partial robust M regression model.
}
\usage{
\method{predict}{sprm}(object, newdata, ...)
}
\arguments{
  \item{object}{
object of class sprm.
}
  \item{newdata}{
optional data frame with new observations.
}
  \item{...}{
further arguments. Currently not used.
}
}
\details{
If \code{newdata} is specified the sprm model is used to predict the fitted values for this data set, otherwise the fitted values of the model are returned.
}
\value{
\code{predict.sprm} returns a vector of the predicted response. 
}
\references{
Sven Serneels et al. (2014) Sparse partial robust M regression
}
\author{
Sven Serneels, BASF Corp and Irene Hoffmann
}

\seealso{
\code{\link{sprms}}, \code{\link{sprmsCV}}
}
\examples{
set.seed(5023)
U1 <- c(rep(2,20), rep(5,30))
U2 <- rep(3.5,50)
X1 <- replicate(5, U1+rnorm(50))
X2 <- replicate(20, U2+rnorm(50))
X <- cbind(X1,X2)
beta <- c(rep(1, 5), rep(0,20))
e <- c(rnorm(45,0,1.5),rnorm(5,-20,1))
y <- X\%*\%beta + e
d <- as.data.frame(X)
d$y <- y
smod <- sprms(y~., data=d, a=1, eta=0.5, fun="Hampel")

dnew <- as.data.frame(cbind(replicate(5, U1+rnorm(10)), replicate(20, U2+rnorm(10))))
ynewp <- predict(smod, newdata=dnew)
}
