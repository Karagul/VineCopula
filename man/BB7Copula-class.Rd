% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BB7copula.R
\docType{class}
\name{BB7Copula-class}
\alias{BB7Copula-class}
\alias{dduCopula,numeric,BB7Copula-method}
\alias{ddvCopula,numeric,BB7Copula-method}
\alias{dduCopula,matrix,BB7Copula-method}
\alias{ddvCopula,matrix,BB7Copula-method}
\alias{getKendallDistr,BB7Copula-method}
\alias{kendallDistribution,BB7Copula-method}
\alias{surBB7Copula-class}
\alias{dduCopula,numeric,surBB7Copula-method}
\alias{ddvCopula,numeric,surBB7Copula-method}
\alias{dduCopula,matrix,surBB7Copula-method}
\alias{ddvCopula,matrix,surBB7Copula-method}
\alias{r90BB7Copula-class}
\alias{dduCopula,numeric,r90BB7Copula-method}
\alias{ddvCopula,numeric,r90BB7Copula-method}
\alias{dduCopula,matrix,r90BB7Copula-method}
\alias{ddvCopula,matrix,r90BB7Copula-method}
\alias{r270BB7Copula-class}
\alias{dduCopula,numeric,r270BB7Copula-method}
\alias{ddvCopula,numeric,r270BB7Copula-method}
\alias{dduCopula,matrix,r270BB7Copula-method}
\alias{ddvCopula,matrix,r270BB7Copula-method}
\title{Classes \code{"BB7Copula"}, \code{"surBB7Copula"}, \code{"r90BB7Copula"} and
\code{"r270BB7Copula"}}
\description{
Wrapper classes representing the BB7, survival BB7, 90 degree and 270 degree
rotated BB7 copula families (Joe 1997) from the
\code{\link{VineCopula-package}} package.
}
\section{Objects from the Classes}{
 Objects can be created by calls of the
form \code{new("BB7Copula", ...)}, \code{new("surBB7Copula", ...)},
\code{new("r90BB7Copula", ...)} and \code{new("r270BB7Copula", ...)} or by
the functions \code{\link{BB7Copula}}, \code{\link{surBB7Copula}},
\code{\link{r90BB7Copula}} and \code{\link{r270BB7Copula}}.
}

\examples{

showClass("BB7Copula")

}
\references{
Joe, H., (1997). Multivariate Models and Dependence Concepts.
Monogra. Stat. Appl. Probab. 73, London: Chapman and Hall.
}
\seealso{
See also \code{\linkS4class{BB1Copula}},
\code{\linkS4class{BB6Copula}}, \code{\linkS4class{BB8Copula}} and
\code{\linkS4class{joeCopula}} for further wrapper classes to the
\code{\link{VineCopula-package}}.
}
\author{
Benedikt Graeler
}
\keyword{classes}
