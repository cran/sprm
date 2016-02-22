\name{biplot.sprm}
\alias{biplot.sprm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Biplot for sprm objects
}
\description{
This biplot for sprm objects visualizes the original variables which contribute to the model and their impact on the latent components as well as the position of the observations in the transformed space. The data is projected onto two of the latent components.
}
\usage{
\method{biplot}{sprm}(x, comps = c(1, 2), 
colors = list(scores = "#0000AA", loadings = "red", background = "#BBBBEE"), 
textsize = 6, arrowshapes = c(25, 0.03), labelpos=0.35, ...)
}
\arguments{
  \item{x}{
object of class sprm.
}
  \item{comps}{
vector with two integers, referring to the components to be plotted.
}
  \item{colors}{
list of three elements named \code{scores}, \code{loadings} and \code{background} with color codes or names of colors.
}
  \item{textsize}{
the text size in which to print the scores and loading names.
}
  \item{arrowshapes}{
vector of length two containing the angle of the arrowheads and their relative length in npc.
}
  \item{labelpos}{
numeric value; determines distance of the arrow label to the arrowhead.
}
  \item{...}{
further arguments. Currently not used.
}
}
\details{
The sparsity of the biplot is inherited by the sparsity of the model. Only the contributing variables are included in the plot, which can lead to better visualization and easier interpretation.
}
\references{
Hoffmann, I., Serneels, S., Filzmoser, P., Croux, C. (2015). Sparse partial robust M regression. Chemometrics and Intelligent Laboratory Systems, 149, 50-59.

Serneels, S., Croux, C., Filzmoser, P., Van Espen, P.J. (2005). Partial Robust M-Regression. Chemometrics and Intelligent Laboratory Systems, 79, 55-64.
}
\author{
Sven Serneels, BASF Corp.
}

\seealso{
\code{\link{plot.sprm}}, \code{\link{sprm}}, \code{\link{biplot.prm}}
}
\examples{
set.seed(5023)
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
mod <- sprms(y~., data=d, a=2, eta=0.5, fun="Hampel")
biplot(mod, comps = c(1, 2))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
