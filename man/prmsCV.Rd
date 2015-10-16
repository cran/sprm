\name{prmsCV}
\alias{prmsCV}
\title{
Cross validation method for PRM regression models.
}
\description{
k-fold cross validation for the selection of the number of components for partial robust M regression.
}
\usage{
prmsCV(formula, data, as, nfold = 10, fun = "Hampel", probp1 = 0.95, hampelp2 = 0.975,
hampelp3 = 0.999, center = "median", scale = "qn", usesvd = FALSE, plot = TRUE, 
numit = 100, prec = 0.01, alpha = 0.15)
}
\arguments{
  \item{formula}{
an object of class formula.
}
  \item{data}{
a data frame or list which contains the variables given in formula.
}
  \item{as}{
a vector with positive integers, which are the number of PRM components to be estimated in the models.
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
  \item{usesvd}{
logical, default is \code{FALSE}. If \code{TRUE} singular value decomposition is performed.
}
  \item{plot}{
logical, default is \code{TRUE}. If \code{TRUE} a plot is generated with a measure of the prediction accuracy for each model (see Details).
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
The \code{alpha} - trimmed mean squared error of the predicted response over all observations is used as robust decision criterion to choose the optimal model. For \code{plot=TRUE} a graphic visualizes the \code{alpha} - trimmed mean squared error for each model.
}
\value{
\item{opt.mod}{object of class prm. (see \code{\link{prms}})}
\item{spe}{matrix with squared prediction error for each observation and each number of components.}
}
\references{
Hoffmann, I., Serneels, S.,  Filzmoser, P. Croux, C., Sparse partial robust M regression. Chemometrics and Intelligent Laboratory Systems. In print.

Serneels, S., Croux, C., Filzmoser, P., Van Espen, P.J., Partial Robust M-Regression. Chemometrics and Intelligent Laboratory Systems, 79 (2005), 55-64.
}
\author{
Irene Hoffmann
}
\seealso{
\code{\link{prms}}, \code{\link{plot.prm}}, \code{\link{predict.prm}}, \code{\link{sprmsCV}}
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
res <- prmsCV(y~., data=d, as=2:4, plot=TRUE, prec=0.05)
summary(res$opt.mod)
}
