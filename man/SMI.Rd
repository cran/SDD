\name{SMI}
\docType{data}
\alias{SMI}
\title{Swiss Market Index}
\description{
 
The \code{SMI} dataset consists of 660 daily returns of the Swiss Market Index spanning the period from August 12th, 2009, to March 6th, 2012 (the share prices used to compute the daily returns are downloadable from \url{http://finance.yahoo.com/}).
}
\usage{data(SMI)}

\format{A time series object}
\source{Yahoo!Finance (2013)  \url{http://finance.yahoo.com/}}
\references{
Bagnato L, De Capitani L, Mazza A, Punzo A (2015). SDD: An {R} Package for Serial Dependence Diagrams. \emph{Journal of Statistical Software}. \bold{64}(2), 1-19 URL: \url{http://www.jstatsoft.org/v64/c02/}

Bagnato L, De Capitani L, Punzo A (2014). Detecting Serial Dependencies with the Reproducibility Probability Autodependogram. \emph{Advances in Statistical Analysis}, \bold{98}(1), 35-61.

Bagnato L, Punzo A (2013). Using the Autodependogram in Model Diagnostic Checking. In N Torelli, F Pesarin, A Bar-Hen (eds.), \emph{Advances in Theoretical and Applied Statistics}, volume XIX of \emph{Studies in Theoretical and Applied Statistics}, pp. 129-139. Springer-Verlag, Berlin Heidelberg.
}
\seealso{
\code{\link{SDD-package}},\code{\link{ADF}}, \code{\link{plot.SDD}}
}
\keyword{datasets}