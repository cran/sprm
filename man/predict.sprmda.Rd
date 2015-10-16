\name{predict.sprmda}
\alias{predict.sprmda}
\title{
Predict method for models of class sprmda
}
\description{
Predictions from SPRM-DA classification model.
}
\usage{
\method{predict}{sprmda}(object, newdata, ...)
}
\arguments{
  \item{object}{
object of class sprmda.
}
  \item{newdata}{
optional data frame with new observations.
}
  \item{...}{
further arguments. Currently not used.
}
}
\details{
If \code{newdata} is specified the SPRM-DA model is used to predict the fitted values for this data set, otherwise the fitted values of the model are returned.
}
\value{
\code{predict.sprmda} returns a vector of the predicted classmembership. 
}
\references{
Hoffmann, I., Filzmoser, P., Serneels, S., Varmuza, K., Sparse and robust PLS for binary classification.
}
\author{
Irene Hoffmann
}

\seealso{
\code{\link{sprmda}}, \code{\link{sprmdaCV}}
}
\examples{
data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
smod <- sprmda(Species~.,data, a=2, eta=0.5, class="lda")
table(data$Species, predict(smod))
}
