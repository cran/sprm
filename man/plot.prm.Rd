\name{plot.prm}
\alias{plot.prm}
\title{
Plots for prm objects
}
\description{
Four types of plot options are available:

y vs y predicted plot, plot of case weights used for robust weighted regression, plot of estimated coefficients, distance-distance plot.
}
\usage{
\method{plot}{prm}(x, type = "yyp", alpha = 0.025, colors = list(bars = "#0000AA", 
errorbars = "red", background = "#BBBBEE", abline = "#21A0D2", scores= "#0000AA",
cutoffs="#00EEEE",  badouts="darkred", modouts="black"), textsize = 6, 
errorbar_width = 1, data, yscale = NULL, ...)
}
\arguments{
  \item{x}{
object of class prm.
}
  \item{type}{
choices are \code{"yyp"}, \code{"weights"}, \code{"coefficients"}, \code{"dd"} (see Details).
}
  \item{alpha}{
significance level. Default is 0.025. Will be ignored if \code{type="weights"}.
}
  \item{colors}{
list with six elements with color codes or names for \code{bar}, \code{errorbars}, \code{background}, \code{abline}, \code{scores} \code{cutoffs}, \code{badouts} (outliers with weight zero) and \code{modouts} (moderate outliers).
}
  \item{textsize}{
the text size in which to print the scores and loading names. Will be ignored if type is \code{"weights"} or \code{"coefficients"}.
}
  \item{errorbar_width}{
a numeric containing the width of the error bars for \code{type="yyp"}.
}
  \item{data}{
optional data frame, containing new cases to predict and plot for \code{type="yyp"} and \code{type="dd"}.
}
  \item{yscale}{
optional scale vector for the yscale in the y vs y predicted plot (e.g. if two different regression plots have to be on the same scale)
}
  \item{...}{
further arguments. Currently not used.
}
}
\details{
The choices for \code{type} are:

\code{type="yyp"} - y vs y predicted plot with confidence intervals for each observation.

\code{type="weights"} - plot of case weights used for robust weighted regression.

\code{type="coefficients"} - plot of the value of each coefficient estimate with confidence interval.

\code{type="dd"} - distance-distance plot for visualization of leverage points. Robust distances are plotted against Mahalanobis distances.
}
\references{
Hoffmann, I., Serneels, S., Filzmoser, P., Croux, C. (2015). Sparse partial robust M regression. Chemometrics and Intelligent Laboratory Systems, 149, 50-59.

Serneels, S., Croux, C., Filzmoser, P., Van Espen, P.J. (2005). Partial Robust M-Regression. Chemometrics and Intelligent Laboratory Systems, 79, 55-64.
}
\author{
Sven Serneels, BASF Corp.
}
\seealso{
\code{\link{prms}}, \code{\link{biplot.prm}}
}
\examples{
set.seed(5023)
U <- c(rep(2,20), rep(5,30))
X <- replicate(6, U+rnorm(50))
beta <- c(rep(1, 3), rep(-1,3))
e <- c(rnorm(45,0,1.5),rnorm(5,-20,1))
y <- X\%*\%beta + e
d <- as.data.frame(X)
d$y <- y
mod <- prms(y~., data=d, a=2, fun="Hampel")

plot.prm(mod, type="yyp", errorbar_width=0.001)
plot(mod, type="coefficients", 
colors = list(bars = "darkgreen", errorbars = "red", background = "lightgray"))
plot(mod, type="weights")
}
