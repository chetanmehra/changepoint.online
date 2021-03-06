\name{PELT.online.initialise}
\alias{PELT.online.initialise}
\title{
PELT.online.initiliase (Pruned Exact Linear Time) - Only intended for developer use.
}
\description{
Implements the PELT method for identifying changepoints in a given set of summary statistics for a specified cost function and penalty.

This function is called by \code{ocpt.mean.initialise}, \code{ocpt.var.initialise}  and \code{ocpt.var.initialise} when \code{method="PELT"}.  This is not intended for use by regular users of the package.  It is exported for developers to call directly for speed increases or to fit alternative cost functions.

WARNING: No checks on arguments are performed!
}
\usage{
PELT.online.initialise(sumstat, pen=0, cost_func = "mean.norm", shape = 1, minseglen = 1)
}
\arguments{
  \item{sumstat}{
	A matrix containing the summary statistics of data within which you wish to find a changepoint.  Currently assumes 3 columns and uses the number of rows as the length of the data +1 (initial value of 0).
}
  \item{pen}{
  Default choice is 0, this should be evaluated elsewhere and a numerical value entered.  This should be positive - this isn't checked but results are meaningless if it isn't.
}
  \item{cost_func}{
  The friendly name of the cost function to be called in C.  If using your own cost function, this must be the name of the C function to use.
}
  \item{shape}{
	Only required for cost_func="Gamma",default is 1.  Must be a positive value, this isn't checked.
}
  \item{minseglen}{
  Positive integer giving the minimum segment length (no. of observations between changes), default is 1.  No checks are performed on the input value so it could be larger than feasible to have changes in the data.
  }
}
\details{
	This function is used as a wrapper function to implement the PELT algorithm in C.  It simply creates the necessary worker vectors, ensures all inputs are the correct type, and passes everything to the C function.
	
	This function is exported for developer use only.  It does not perform any checks on inputs (other than type coersion) and is simply a wrapper function for the C code.
}
\value{
	A list is returned with elements:
	\item{cost_func}{The cost function that has been used.}
	\item{sumstat}{The summary statistics for the time series.}
	\item{ndone}{Length of the time series when analysis begins.}
	\item{nupdate}{Length of the time series to be analysed in this update.}
	\item{penalty}{Penalty used to decide if a changepoint is significant.}
	\item{cptsout}{Vector of locations of the identified changepoints up to (ndone+nupdate).}
	\item{error}{0 by default, nonzero indicates error in code.}
	\item{shape}{Only used when cost_func is the gamma likelihood. Otherwise 1.}
	\item{minseglen}{Minimum segment length.}
		\item{lastchangelike}{Vector of lenght n containing the likelihood of the optimal segmentation up to each timepoint.}
	\item{lastchangecpts}{Vector of length n containing the last changepoint prior to each timepoint.}
	\item{checklist}{Vector of locations of the potential last changepoint for next iteration (to be updated), max length=(ndone+nupdate).}
	\item{nchecklist}{Number in the checklist currently (to be updated).}
	\item{numchangecpts}{Stores the current number of changepoints detected.}
}
\references{
PELT Algorithm: Killick R, Fearnhead P, Eckley IA (2012) Optimal detection of changepoints with a linear computational cost, \emph{JASA} \bold{107(500)}, 1590--1598

CROPS: Haynes K, Eckley IA, Fearnhead P (2014) Efficient penalty search for multiple changepoint problems (in submission), arXiv:1412.3617
}
\author{
Andrew Connell, Rebecca Killick
}


\seealso{
\code{\link{PELT.online}},\code{\link{PELT.online.update}},\code{\linkS4class{ocpt}}
}
\examples{
#This function should only be used by developers, see its use in ocpt.mean.initialise and ocpt.mean.initialize.
}

\keyword{methods}
\keyword{univar}
\keyword{models}
\keyword{ts}
