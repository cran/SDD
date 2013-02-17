\name{plot.SDD}
\alias{plot.SDD}
\title{Plot Method for SDD objects}
\description{
 Plot method for objects of class \code{"SDD"}.
}
\usage{
  \method{plot}{SDD} (x, norm = FALSE, stability = FALSE, step = 5, \dots)
}  

\arguments{
  \item{x}{a \code{SDD} object}
  \item{norm}{
  an optional logical; if \code{TRUE}, when \code{dtype="ADF"} or when \code{dtype="ACF"}, the "normalized" p-values of the ADF are computed.
  }
  \item{stability}{an optional logical; if \code{TRUE}, when \code{dtype="RPADF"}, to evaluate the stability of the test-results a graphical representation of the confidence interval is displayed.
  }
  \item{step}{
  an optional scalar; it sets the step between x-ticks in plot. Default value is 5. 
  }
   \item{\dots}{graphics parameters to be passed to the plotting
    routines.}
}

\value{
No values are returned from the plot function.

}
\author{
Luca Bagnato, Lucio De Capitani, Angelo Mazza and Antonio Punzo
}

\seealso{
\code{\link{SDD-package}}, \code{\link{ADF}}, \code{\link{SMI}}
}
\examples{
data("SMI")
res <- ADF(SMI, plot=FALSE)
plot(res)


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
