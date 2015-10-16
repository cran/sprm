\name{summary.prmda}
\alias{summary.prmda}
\alias{print.prmda}
\title{
Summary of a prmda model
}
\description{
Summarizing models of class prmda. 
}
\usage{
\method{summary}{prmda}(object, ...)
\method{print}{prmda}(x, ...)
}
\arguments{
  \item{object, x}{
object of class prmda
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
\code{\link{prmda}}
}
\examples{
data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
mod <- prmda(Species~.,data, a=2, class="lda")
mod
summary(mod)
}
