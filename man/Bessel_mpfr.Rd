\name{Bessel_mpfr}
\title{Bessel functions of Integer Order in multiple precisions}
\alias{Bessel_mpfr}
\alias{Ai}
\alias{j0}
\alias{j1}
\alias{jn}
\alias{y0}
\alias{y1}
\alias{yn}
\description{
  Bessel functions of integer orders, provided via arbitrary precision
  algorithms from the MPFR library.

  Note that the computation can be very slow when \code{n} \emph{and}
  \code{x} are large (and of similar magnitude).
  % e.g. on nb-mm3,  jn(4e4, 4e4)  takes 14 sec [1.1. 2015]
}
\usage{
Ai(x)
j0(x)
j1(x)
jn(n, x, rnd.mode = c("N","D","U","Z","A"))
y0(x)
y1(x)
yn(n, x, rnd.mode = c("N","D","U","Z","A"))
}
\arguments{
  \item{x}{a \code{\link{numeric}} or \code{\linkS4class{mpfr}} vector.}
  \item{n}{non-negative integer (vector).}
  \item{rnd.mode}{a 1-letter string specifying how \emph{rounding}
    should happen at C-level conversion to MPFR, see \code{\link{mpfr}}.}
}
\value{
  Computes multiple precision versions of the Bessel functions of
  \emph{integer} order, \eqn{J_n(x)}{J[n](x)} and \eqn{Y_n(x)}{Y[n](x)},
  and---when using MPFR library 3.0.0 or newer---also of the Airy function
  \eqn{Ai(x)}.
}
\seealso{\code{\link{besselJ}}, and \code{\link{besselY}} compute the
  same bessel functions but for arbitrary \emph{real} order and only
  precision of a bit more than ten digits.
}
\examples{
x <- (0:100)/8 # (have exact binary representation)
stopifnot(  all.equal(besselY(x, 0), bY0 <- y0(x))
          , all.equal(besselJ(x, 1), bJ1 <- j1(x))
          , all.equal(yn(0,x), bY0)
          , all.equal(jn(1,x), bJ1)
         )
}
\keyword{math}
