\name{ADF}
\alias{ADF}
\alias{print.SDD}
\title{Serial Dependence Diagrams}
\description{The function computes (and by default plots) different types of serial dependence diagrams.}
\usage{
ADF(x, dtype = c("ADF", "CADF", "RPADF", "DeltaADF", "ACF"), 
    lag.max = floor(10 * log10(length(x))), alpha = 0.05, 
    num.clas, B = 99, bandwidth, delta = "Delta_1", fres = ".Perm", 
    fdenest = ".denest", fdiv, argacf, R = 1:lag.max, 
    p.adjust.method =  p.adjust.methods, plot = TRUE,
    \dots)
\method{print}{SDD}(x, digits=3, \dots)

}
                 
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
  an \code{"ADF"} object or a univariate numeric time series object or a numeric vector.
}
 \item{dtype}{
  an optional character string. It specifies the type of autodependence function and must be:
  \itemize{
      \item \code{"ADF"} (default; see Bagnato, Punzo, Nicolis, 2012)
      \item \code{"CADF"}  (see Bagnato, Punzo, Nicolis, 2012)
      \item \code{"RPADF"} (see Bagnato, De Capitani, Punzo, 2014)
      \item \code{"DeltaADF"}  (see Bagnato, De Capitani, Punzo, 2013)
      \item \code{"ACF"} 
  }
}
  \item{lag.max}{
  maximum lag at which to calculate the ADF. Default is \code{10*log10(n)} where \code{n} is  the length of the series . 
  }
  \item{alpha}{
  significance level of the tests of lag-independence (related to each bar). Default value is 0.05.
}

  \item{num.clas}{
  when \code{dtype="ADF"} or \code{"CADF"} or \code{"RPADF"}, it sets the number of equifrequency classes for each of the two marginal distributions of the contingency table. If not specified, it is determined internally
  using a rule of thumb described in Bagnato, Punzo, Nicolis (2012).
}
  \item{B}{
  when \code{dtype="DeltaADF"}, it sets the number of permutations used. Default value is 99 (see Bagnato, De Capitani, Punzo, 2013a,b).
}  
  \item{bandwidth}{
  when \code{dtype="DeltaADF"}, it sets the bandwidth used for the Gaussian kernel density estimator. Default value is computed with likelihood cross-validation (see Bagnato, De Capitani, Punzo, 2013a,b).
}
\item{delta}{
  a character vector; when \code{dtype="DeltaADF"}, it specifies the type of divergence measure used (see Bagnato, De Capitani, Punzo, 2013b);
  for each element in \code{delta} a different plot is produced. Possible values are:
  \itemize{
      \item \code{"Delta_1"} (default)
      \item \code{"Delta_0.5"} 
      \item \code{"Delta_2"} 
      \item \code{"Delta_3"} 
      \item \code{"Delta_4"} 
      \item \code{"Delta_SD"} 
      \item \code{"Delta_L1"} 
      \item \code{"Delta_ST"} 
      \item \code{"Delta_fdiv"}; in this case, the external function named \code{fdiv} is used to compute divergence.
 }
}
   \item{fres}{
  an optional character string which specifies, when \code{dtype="DeltaADF"}, the name of the external \code{function(x,B)} specifying the resampling method from the raw series, where \code{x} is a time series and \code{B} the number of resamples; the function should return a matrix with \code{B} rows and \code{length(x)} columns. If not specified, permutations are randomly generated.
  }
  \item{fdenest}{
  an optional character string which specifies when \code{dtype="DeltaADF"}, the name of the external \code{function(x,m,ngrid,bandwidth)} to use for univariate and bivariate density estimation, where \code{x} is the time series, \code{m} is the lag considered, \code{ngrid} is the number of
  points in the grid, and \code{bandwidth} is the bandwidth; the function should return: 
    \itemize{
      \item \code{fi}, a matrix of dimension \code{ngrid} x \code{ngrid} containing conjoint density estimates for lag \code{m}
      \item \code{gi}, a matrix of dimension \code{ngrid} x \code{ngrid} containing conjoint density estimates in case of independence, for lag \code{m}
      \item \code{ngi}, is equal to \code{ngrid}.
    }  
 If \code{fdenest} is not specified, the Gaussian kernel density estimation is used (see Bagnato, De Capitani, Punzo, 2013a,b).
  }    
  \item{fdiv}{
an optional character string which specifies, when \code{dtype="DeltaADF"} and \code{delta="Delta_fdiv"} , the name of the external \code{function(fi,gi,ngi)} to use to compute divergence; its arguments are defined as in \code{fdenest}; the function should return a scalar. 
  }

  \item{plot}{
if \code{TRUE} (default), the specified ADF is displayed.
  }
\item{argacf}{
when \code{dtype="ACF"}, it is a list with optional arguments for function \code{acf()}.
  }
    \item{R}{
a vector. It specifies the lags on which to test for simultaneous independence (see Bagnato, Punzo, 2010, 2012 and Bagnato, De Capitani, Punzo, 2013b). Default value is \code{1:lag.max}
  }  
  \item{p.adjust.method}{
a character string. It specifies the method to be used in the simultaneous independence test. It must be one of \code{\link[stats:p.adjust.methods]{p.adjust.methods}}.
  }
  \item{\dots}{
optional arguments to be passed to the  \code{\link{plot.SDD}} method, such as graphical parameters.
  }
\item{digits}{
  minimal number of significant digits.
}
} 
  
\details{
There are print and data.frame methods for objects of class "ADF".
}
\value{
Returned from this function is a \code{SDD} object which is a list with the following components:
\item{res}{
  a data frame. According to \code{dtype}, it may contain:
\itemize{
      \item \code{lag}, {a numeric vector containing the lags at which the bars of the diagrams are computed}
      \item \code{vbar}, {height of the bars of the diagram}
      \item \code{pvalue}, {p-values associated to the bars of the diagram}
      \item \code{pstar},  transformed p-values associated to the bars of the diagram. If \code{dtype="DeltaADF"} transformed p-values are \code{vbar}  
      \item \code{n},  vector of length \code{lag.max}, containing the effective number of pairs considered for each lag 
      \item \code{crit.val}, vector, of length lag.max, with the critical values
      \item \code{xmin}  vector of length \code{lag.max}, containing the non-centrality parameters for each bar of the RP-ADF
    }
  }
  \item{dtype}{
  a character string. It specifies the type of serial dependence diagram generated.}
  \item{delta}{a character string. It specifies, when \code{type="DeltaADF"}, the type divergence measure used.}
  \item{num.clas}{
  a scalar. It is the number of classes in each contingency table.}
  \item{alpha}{a scalar. It specifies the significance level of the tests of lag independence (related to each bar). }
  \item{df}{
  a scalar. It contains the degrees of freedom of the reference chi-square distribution used when \code{dtype} is one of: \code{"ADF", "RPADF",} or \code{"CADF"}.}  
  \item{bandwidth}{
  a scalar. It is the bandwidth used in kernel density estimation.}
 \item{series}{
 the name of the series \code{x}.
 }
  \item{R}{
a vector. It specifies the lags to test in the simultaneous independence tests.
  }  
  \item{p.adjust.method}{
a character string. It specifies the method to be used in the simultaneous independence tests. It must be one of \code{\link[stats:p.adjust.methods]{p.adjust.methods}}. 
  }
 \item{p.adjust}{
a vector. It contains the adjusted probabilities for the simultaneous independence tests. 
  }  
}

\references{
Bagnato L, De Capitani L, Punzo A (2013a). Improving the autodependogram using the Kulback-Leibler divergence. \emph{Communications in Statistics - Simulation and Computation}. (Submitted).

Bagnato L, De Capitani L, Punzo A (2013b). Testing Serial Independence via Density-Based Measures of Divergence. \emph{Methodology and Computing in Applied Probability}. doi:10.1007/s11009-013-9320-4.

Bagnato L, De Capitani L, Punzo A (2014). Detecting Serial Dependencies with the Reproducibility Probability Autodependogram. \emph{Advances in Statistical Analysis}, \bold{98}(1), 35-61.

Bagnato L, Punzo A (2010). On the Use of \eqn{\chi^2} Test to Check Serial Independence. \emph{Statistica & Applicazioni}, \bold{VIII}(1), 57-74.

Bagnato L, Punzo A (2012). Checking Serial  Independence of Residuals from a Nonlinear Model. In W Gaul, A Geyer-Shulz, L Schmidt-Thieme, J Kunze (eds.), \emph{Challenges at the Interface of Data Analysis, Computer Science, and Optimization}, volume XIV of \emph{Studies in Classification, Data Analysis and Knowledge Organization}, pp. 203-211. Springer-Verlag, Berlin Heidelberg.

Bagnato L, Punzo A, Nicolis O (2012). The autodependogram: a graphical device to investigate serial dependencies. \emph{Journal of Time Series Analysis}, \bold{33}(2), 233-254.

Bagnato L, Punzo A (2013). Using the Autodependogram in Model Diagnostic Checking. In N Torelli, F Pesarin, A Bar-Hen (eds.), \emph{Advances in Theoretical and Applied Statistics}, volume XIX of \emph{Studies in Theoretical and Applied Statistics}, pp. 129-139. Springer-Verlag, Berlin Heidelberg.

}
\author{
Luca Bagnato, Lucio De Capitani, Angelo Mazza and Antonio Punzo
}
%%\note{
%%  ~~further notes~~
%%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{                  
\code{\link{SDD-package}}, \code{\link{plot.SDD}}, \code{\link{SMI}}, \code{\link[stats:acf]{acf}}
}
\examples{

# Dependence Diagrams on raw data

data("SMI")
ADF(SMI^2, dtype="ACF", main="")
ADF(SMI, main="") 
ADF(SMI, dtype="RPADF", main="")

# Dependence Diagrams on residuals from a fitted model

library("tseries")
residuals <- garch(SMI, order=c(1,1))$residuals[-1]
ADF(residuals^2, dtype="ACF", main="")
ADF(residuals, dtype="RPADF", main="")
}

