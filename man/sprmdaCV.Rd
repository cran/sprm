\name{sprmdaCV}
\alias{sprmdaCV}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Cross validation method for sparse PRM classification models.
}
\description{
k-fold cross validation for the selection of the number of components for sparse PRM classification.
}
\usage{
sprmdaCV(formula, data, as, etas, nfold = 10, fun = "Hampel", 
probp1 = 0.95, hampelp2 = 0.975, hampelp3 = 0.999, probp4=0.01, yweights = TRUE,
class = c("regfit", "lda"), prior = c(0.5, 0.5), center = "median", scale = "qn", 
print = FALSE, plot = TRUE, numit = 100, prec = 0.01)
}

\arguments{
  \item{formula}{
a formula, e.g. group ~ X1 + X2 with group a factor with two levels or a numeric vector coding 
class membership with 1 and -1 and X1,X2 numeric variables.
}
  \item{data}{
a data frame or list which contains the variables given in formula. The response specified in the 
formula needs to be a numeric vector coding the class membership with 1 and-1 or 
a vector of factors with two levels.
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
  \item{probp4}{
a quantile close to zero for the cutoff for potentially wrong class labels (see Reference). Ignorred if \code{yweights=FALSE}.
}
  \item{yweights}{
logical; if TRUE weights are calculated for observations with potentially wrong class labels.
}
  \item{class}{
type of classification; choices are "regfit" or "lda". If "regfit" an object of class prm is returned.
}
  \item{prior}{
vector of length 2 with proir probabilities of the groups; only used if class="lda".
}
  \item{center}{
type of centering of the data in form of a string that matches an R function, e.g. "mean" or "median".
}
  \item{scale}{
type of scaling for the data in form of a string that matches an R function, e.g. "sd" or "qn" or alternatively "no" for no scaling.
}
  \item{print}{
logical, default is \code{FALSE}. If \code{TRUE} the variables included in each component are reported.
}
  \item{plot}{
logical, default is \code{TRUE}. If \code{TRUE} two contour plots are generated for number of components and sparsity parameter. The first contour plot shows
the mean weighted misclassification rate (see Details) the second the number of variables in the model.
}
  \item{numit}{
the number of maximal iterations for the convergence of the coefficient estimates.
}
  \item{prec}{
a value for the precision of estimation of the coefficients.
}
}
\details{
The robust cross validation creterion is a weighted misclassification rate. Class assignment of outliers is unreliable. Therefore, the case weights from the model are used to downweight the influence observations which were detected as outliers on the misclassification rate.

There may occur combinations of \code{"a"} and \code{"eta"} where the model cannot be estimated. Then the function issues a warning "CV broke off at \code{"a"} and \code{"eta"}".
}
\value{
\item{opt.mod}{object of class sprmda with the selected parameters. (see \code{\link{sprms}})}
\item{pcm}{array with predicted class membership of each observation and for each combination of tuning parameters}
\item{nzcoef}{array with the number of variables in the model for each cross validation subset and each combination of tuning parameters}
}
\references{
Hoffmann, I., Filzmoser, P., Serneels, S., Varmuza, K., Sparse and robust PLS for binary classification.
}
\author{
Irene Hoffmann
}


\seealso{
\code{\link{sprmda}}, \code{\link{predict.sprmda}}, \code{\link{prmdaCV}}
}
\examples{
data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
## for demonstration with only two values in etas
smod <- sprmdaCV(Species~.,data, as=2:3, etas=c(0.1,0.9), nfold=5, 
                 class="lda", numit=10, prec=0.1)
\dontrun{
## in practis a finer grid of as and etas should be searched 
## at the expence of computation time
smod <- sprmdaCV(Species~.,data, as=1:4, etas=seq(0.1,0.9,0.1), nfold=5, 
                 class="lda", numit=10, prec=0.1)
}
}
