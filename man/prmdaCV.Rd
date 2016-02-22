\name{prmdaCV}
\alias{prmdaCV}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Cross validation method for PRM classification models.
}
\description{
k-fold cross validation for the selection of the number of components for PRM classification.
}
\usage{
prmdaCV(formula, data, as, nfold = 10, fun = "Hampel", probp1 = 0.95, hampelp2 = 0.975,
hampelp3 = 0.999, probp4 = 0.01, yweights = TRUE, 
class = c("regfit", "lda"), prior = c(0.5, 0.5), center = "median", scale = "qn", 
plot = TRUE, numit = 100, prec = 0.01)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formula}{
a formula, e.g. group ~ X1 + X2 with group a factor with two levels and X1,X2 numeric variables.
}
  \item{data}{
a data frame or list which contains the variables given in formula. The response specified in the 
formula needs to be a numeric vector coding the class membership with 1 and-1 or 
a vector of factors with two levels.
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
type of centering of the data in form of a string that matches an R function, e.g. \code{"mean"} or \code{"median"}.
}
  \item{scale}{
type of scaling for the data in form of a string that matches an R function, e.g. \code{"sd"} or \code{"qn"} or alternatively \code{"no"} for no scaling.
}
  \item{plot}{
logical, default is \code{TRUE}. If \code{TRUE} a plot is generated with a mean weighted misclassification rate for each model (see Details).
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
}
\value{
\item{opt.mod}{object of class prmda. (see \code{\link{prmda}})}
\item{pcm}{matrix with predicted class membership for each observation and each number of components.}
}
\references{
Hoffmann, I., Filzmoser, P., Serneels, S., Varmuza, K., Sparse and robust PLS for binary classification.
}
\author{
Irene Hoffmann
}

\seealso{
\code{\link{prmda}}, \code{\link{biplot.prmda}}, \code{\link{predict.prmda}}, \code{\link{sprmdaCV}}
}
\examples{
data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
mod <- prmdaCV(Species~.,data, as=1:2, class="lda", numit=10, prec=0.1)
biplot(mod$opt.mod)
}

