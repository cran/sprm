\name{biplot.sprmda}
\alias{biplot.sprmda}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Biplot for sprmda objects of Sparse PRM discriminant analysis
}
\description{
This biplot for sprmda objects visualizes the original variables which contribute to the model and 
their impact on the latent components as well as the position of the observations in the transformed space.
The data is projected onto two of the latent components and colored according to class membership.
}
\usage{
\method{biplot}{sprmda}(x, comps = c(1, 2), 
colors = list(scores1="orange", scores2="darkgreen", loadings="red", background="gray84"),
textsize = 6, arrowshapes = c(25, 0.03), labelpos = 0.35, ...)
}
\arguments{
  \item{x}{
object of class sprmda.
}
  \item{comps}{
  vector with two integers, referring to the components to be plotted.
}
  \item{colors}{
list of four elements named \code{scores1} (for observations of group coded with 1), \code{scores2} (for observations of group coded with -1), \code{loadings} and \code{background} with color codes or names of colors.
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
  \item{\dots}{
further arguments. Currently not used.
}
}
\details{
The sparsity of the biplot is inherited by the sparsity of the model. Only the contributing variables are included in the plot, which can lead to better visualization and easier interpretation.
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
biplot(smod)
}

\keyword{ biplot }
\keyword{ classification }
