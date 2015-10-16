\name{predict.prmda}
\alias{predict.prmda}
\title{
Predict method for models of class prmda
}
\description{
Predictions for a PRM-DA classification model.
}
\usage{
\method{predict}{prmda}(object, newdata, ...)
}
\arguments{
  \item{object}{
object of class prmda.
}
  \item{newdata}{
optional data frame with new observations.
}
  \item{...}{
further arguments. Currently not used.
}
}
\details{
If \code{newdata} is specified the PRM-DA classification model is used to predict the fitted values for this data set, otherwise the fitted values of the model are returned.
}
\value{
\code{predict.prmda} returns a vector of the predicted classmembership. 
}
\references{
Hoffmann, I., Filzmoser, P., Serneels, S., Varmuza, K., Sparse and robust PLS for binary classification.
}
\author{
Irene Hoffmann
}
\seealso{
\code{\link{prmda}}, \code{\link{prmdaCV}}
}
\examples{
data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
mod <- prmda(Species~.,data, a=2, class="lda")
table(data$Species, predict(mod))
}