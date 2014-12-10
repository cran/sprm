\name{biplot.prm}
\alias{biplot.prm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Biplot for prm objects
}
\description{
This biplot for prm objects visualizes the original variables which contribute to the model and their impact on the latent components as well as the position of the observations in the transformed space. The data is projected onto two of the latent components.}
\usage{
\method{biplot}{prm}(x, comps = c(1, 2), 
colors = list(scores = "#0000AA", loadings = "red", background = "#BBBBEE"), 
textsize = 6, arrowshapes = c(25, 0.03), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
object of class prm.
}
  \item{comps}{
vector with two integers, referring to the components to be plotted.
}
  \item{colors}{
list of three elements named \code{scores}, \code{loadings} and \code{background} with color codes or names.
}
  \item{textsize}{
the text size in which to print the scores and loading names.
}
  \item{arrowshapes}{
vector of length two containing the angle of the arrowheads and their relative length in npc.
}
  \item{...}{
further arguments. Currently not used.
}
}
\references{
Sven Serneels et al. (2014) Sparse partial robust M regression

Serneels, S., Croux, C., Filzmoser, P., Van Espen, P.J., Partial Robust M-Regression. Chemometrics and Intelligent Laboratory Systems, 79 (2005), 55-64.
}
\author{
Sven Serneels, BASF Corp.
}
\seealso{
\code{\link{plot.prm}}, \code{\link{prms}}, \code{\link{biplot.sprm}}
}
\examples{
set.seed(5023)
U <- c(rep(3,20), rep(4,30))
X <- replicate(6, U+rnorm(50))
beta <- c(rep(1, 3), rep(-1,3))
e <- c(rnorm(45,0,1.5),rnorm(5,-20,1))
y <- X\%*\%beta + e
d <- as.data.frame(X)
d$y <- y
mod <- prms(y~., data=d, a=2, fun="Hampel")
biplot(mod, comps = c(1, 2))
}
