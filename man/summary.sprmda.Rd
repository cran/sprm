\name{summary.sprmda}
\alias{summary.sprmda}
\alias{print.sprmda}
\title{
Summary of a sprmda model
}
\description{
Summarizing models of class sprmda. 
}
\usage{
\method{summary}{sprmda}(object, ...)
\method{print}{sprmda}(x, ...)
}
\arguments{
  \item{object, x}{
object of class sprmda.
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
Hoffmann, I., Filzmoser, P., Serneels, S., Varmuza, K., Sparse and robust PLS for binary classification.
}
\author{
Irene Hoffmann
}
\seealso{
\code{\link{sprmda}}
}
\examples{
data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
smod <- sprmda(Species~.,data, a=2, eta=0.7, class="lda")
smod
summary(smod)
}