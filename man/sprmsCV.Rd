\name{sprmsCV}
\alias{sprmsCV}
\title{
Cross validation method for SPRM regression models.
}
\description{
k-fold cross validation for the selection of the number of components and the sparsity parameter for sparse partial robust M regression.
}
\usage{
sprmsCV(formula, data, as, etas, nfold = 10, fun = "Hampel", probp1 = 0.95, 
hampelp2 = 0.975, hampelp3 = 0.999, center = "median", scale = "qn", 
plot = TRUE, numit = 100, prec = 0.01, alpha = 0.15)
}
\arguments{
  \item{formula}{
an object of class formula.
}
  \item{data}{
a data frame or list which contains the variables given in formula.
}
  \item{as}{
a vector with positive integers, which are the number of SPRM components to be estimated in the models.
}
  \item{etas}{
vector of values for the tuning parameter for the sparsity. Values have to between 0 and 1.
}
 \item{nfold}{
the number of folds used for cross validation, default is \code{nford=10} for 10-fold CV.
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
  \item{plot}{
logical, default is \code{TRUE}. If \code{TRUE} two contour plots are generated for number of components and sparsity parameter. The first contour plot shows
the trimmed mean squared error of the prediction of the response (see Details) the second the number of variables in the model.
}
  \item{numit}{
the number of maximal iterations for the convergence of the coefficient estimates.
}
  \item{prec}{
a value for the precision of estimation of the coefficients.
}
  \item{alpha}{
value used for alpha trimmed mean squared error, which is the cross validation criterion (see Details).
}
}
\details{
The \code{alpha} - trimmed mean squared error of the predicted response over all observations is used as robust decision criterion to choose the optimal model.

There may occur combinations of \code{"a"} and \code{"eta"} where the model cannot be estimated. Then the function issues a warning "CV broke off at \code{"a"} and \code{"eta"}".

}
\value{
\item{opt.mod}{object of class sprm with the selected parameters. (see \code{\link{sprms}})}
\item{spe}{array with squared prediction error for each observation and each combination of tuning parameters}
\item{nzcoef}{array with the number of variables in the model for each cross validation subset and each combination of tuning parameters}
}
\references{
Hoffmann, I., Serneels, S., Filzmoser, P., Croux, C. (2015). Sparse partial robust M regression. Chemometrics and Intelligent Laboratory Systems, 149, 50-59.

Serneels, S., Croux, C., Filzmoser, P., Van Espen, P.J. (2005). Partial Robust M-Regression. Chemometrics and Intelligent Laboratory Systems, 79, 55-64.
}
\author{
Irene Hoffmann
}
\seealso{
\code{\link{sprms}}, \code{\link{plot.sprm}}, \code{\link{predict.sprm}}, \code{\link{prmsCV}}
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
res <- sprmsCV(y~., data=d, as=1:2, etas=seq(0,0.9,0.2), nfold=5, fun="Hampel", prec=0.1)
summary(res$opt.mod)
}
