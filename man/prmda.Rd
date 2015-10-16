\name{prmda}
\alias{prmda}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Robust PLS for binary classification
}
\description{
Robust PLS and discriminant analysis for binary classification problems.
This method for dimension reduction and discriminant analysis yields a classification model
with a partial least squares alike interpretability that is robust to both vertical outliers and leverage points.
}

\usage{
prmda(formula, data, a, fun = "Hampel", probp1 = 0.95, hampelp2 = 0.975, 
hampelp3 = 0.999, probp4 = 0.01, yweights = TRUE, 
class = c("regfit", "lda"), prior = c(0.5, 0.5), 
center = "median", scale = "qn", 
numit = 100, prec = 0.01)
}
%- maybe also 'usage' for other objects documented here.
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
  \item{a}{
the number of PRM components to be estimated in the model.
}
  \item{fun}{
an internal weighting function for case weights. Choices are \code{"Hampel"} (preferred), \code{"Huber"} or \code{"Fair"}.
}
  \item{probp1}{
a quantile close to 1 at which to set the first outlier cutoff for the weighting function.
}
  \item{hampelp2}{
a quantile close to 1 with probp1<hampelp2 for second cutoff. Only applies to \code{fun="Hampel"}.
}
  \item{hampelp3}{
a quantile close to 1 with probp1<hampelp2<hampelp3 for third cutoff. Only applies to \code{fun="Hampel"}.
}
  \item{probp4}{
a quantile close to zero for the cutoff for potentially wrong class labels (see Reference). Ignorred if \code{yweights=FALSE}.
}
  \item{yweights}{
logical; if TRUE weights are calculated for observations with potentially wrong class labels.
}
  \item{class}{
type of classification; choices are "regfit" or "lda" (see Detail). If "regfit" an object of class prm is returned.
}
  \item{prior}{
vector of length 2 with prior probabilities of the groups; only used if class="lda".
}
  \item{center}{
type of centering of the data in form of a string that matches an R function, e.g. "mean" or "median".
}
  \item{scale}{
type of scaling for the data in form of a string that matches an R function, e.g. "sd" or "qn" or alternatively "no" for no scaling.
}
  \item{numit}{
the number of maximal iterations for the convergence of the case weights.
}
  \item{prec}{
a value for the precision of the convergence of the case weights.
}
}
\details{
For \code{class="lda"} a robust LDA model is estimated in the PRM score space for \code{class="regfit"} the model ist a robust PLS regression model on the binary response.
}
\value{
prmda returns an object of class prmda.

Functions \code{summary}, \code{predict} and \code{biplot} are available. Also the generic functions \code{coefficients}, \code{fitted.values} and \code{residuals} can be used to extract the corresponding elements from the sprmda object.

\item{scores}{the matrix of scores.}
%\item{weighting.vectors}{the matrix to transform data to scorse.}
\item{R}{Direction vectors (or weighting vectors or rotation matrix) to obtain the scores. \code{scores=Xs\%*\%R}.}
\item{loadings}{the matrix of loadings.}
\item{w}{the overall case weights used for robust dimenstion reduction and classification (depending on the weight function). \code{w=sqrt(wy*wt)}.}
\item{wt}{the group wise obtained case weights in the score space.}
\item{wy}{the case weights for potentially mislabeled observations.}

Results from LDA model:
\item{ldamod}{list with robust pooled within-group covariance (cov) and the two robust group centers (m1, m2) in the score space}
\item{ldafit}{postirior probabilities from robust LDA in the score space.}
\item{ldaclass}{predicted class labels from robust LDA in the score space.}


Results from the regression model with binary response:
\item{coefficients}{vector of coefficients of the weighted regression model.}
\item{intercept}{intercept of weighted regression model.}
\item{residuals}{vector of residuals, true response minus estimated response.}
\item{fitted.values}{the vector of estimated response values.}
\item{coefficients.scaled}{vector of coefficients of the weighted regression model with scaled data.}
\item{intercept.scaled}{intercept of weighted regression model with scaled data.}

Data preprocessing:
\item{YMeans}{value used internally to center response.}
\item{XMean}{vector used internally to center data.}
\item{Xscales}{vector used internally to scale data.}
\item{Yscales}{value used internally to scale response.}

\item{inputs}{list of inputs: parameters, data and scaled data.}
}
\references{
Hoffmann, I., Filzmoser, P., Serneels, S., Varmuza, K., Sparse and robust PLS for binary classification.
}
\author{
Irene Hoffmann and Sven Serneels
}

\seealso{
\code{\link{prmdaCV}}
}
\examples{
data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
mod <- prmda(Species~.,data, a=2, class="lda")
}

