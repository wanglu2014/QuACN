\name{infoTheoreticGCM}
\alias{infoTheoreticGCM}
\title{Information theoretic graph complexity meassures
}
\description{Measures of this group assign a probability value to each
  vertex of the network using a so-called information functional f which
  captures structural information of the network g.
  Note that some combinations of the settings can cause the descriptor to retrun NaN. In that case you have to check for warnings.
}
\usage{
infoTheoreticGCM(g, dist = NULL, coeff = "lin", infofunct = "sphere",
lambda = 1000, custCoeff=NULL, alpha=0.5, prec=53, flag.alpha=FALSE)
}
\arguments{
  \item{g}{a graph as a graphNEL object.
}
  \item{dist}{the distance matrix of the graph. If the parameter is empty the distance matrix will be calculated within the function.
}
  \item{coeff}{specifies the weighting coefficient. Possible values are
    "lin" (default), "quad", "exp", "const" or "cust". If it is set to
    "cust" you have to specify your customized weighting schema with the
    parameter custCoeff.
}
  \item{infofunct}{specifies the information functional. Possible values
    are "sphere" (default), "pathlength", "vertcent" or "degree"
.
}
  \item{lambda}{specifies the scaling constant for the distance
    measures. The default value is 1000.
}
  \item{custCoeff}{specifies the customized weighting schema. To use it you
    need to set coeff="const".
}
  \item{alpha}{alpha for degree degree association.
}
  \item{prec}{specifies the floating-point precision to use (currently
    only implemented for degree-degree association).  Values up to 53
    are handled with the built-in double data type; larger values
    trigger the usage of Rmpfr.
}
  \item{flag.alpha}{if set, the base 0.5 exponential function will be
    applied to the values of the "sphere" functional.
}
}
\details{For details see the vignette.
}
\value{
  The returned list consists of the following items:
  \item{entropy}{contains the calculated entropy measure.}
  \item{distance}{contains the calculated distance measure.}
  \item{pis}{contains the calculated probability distribution.}
  \item{fvi}{contains the calculated values of the information
    functional, for each vetrex.}

  If any of these values is NaN, please check if your parameters are
  valid.  For infofunct="degree" in particular, the result might be
  impossible to represent using a standard R numeric vector.  In this
  case the "prec" parameter has to be set to a higher value.

  If infofunct is "degree" and prec is greater than 53, the resulting
  values will be of class "mpfr" (instead of "numeric" in all other
  cases).  Note that if you use such a vector in a calculation,
  arbitrary precision floating point arithmetics will be used
  throughout, even if the other operands are regular double values.  You
  can use "as.double" at any point to convert an "mpfr" vector to the
  built-in "numeric" class (losing precision).
}
\references{
M. Dehmer, Information processing in complex networks: Graph entropy and
information functionals, Applied Mathematics and Computation, 202:82-94, 2008

Dehmer M., Emmert-Streib F., Tsoy R. Y., Varmuza K.: Quantifying Structural Complexity of Graphs: 
Information Measures in Mathematical Chemistry. In: Putz M. (Editor): Quantum Frontiers of Atoms and Molecules in Physics, 
Chemistry, and Biology,  Nova Science Publishers, to appear, 2010

}
\author{Laurin Mueller
}

\examples{

library(RBGL)
set.seed(123)
g <- randomGraph(1:8, 1:5, 0.36, weights=FALSE)
mat.dist <- distanceMatrix(g)

infoTheoreticGCM(g)
infoTheoreticGCM(g,mat.dist,coeff="lin",infofunct="sphere",lambda=1000)
infoTheoreticGCM(g,mat.dist,coeff="const",infofunct="pathlength",lambda=4000)
infoTheoreticGCM(g,mat.dist,coeff="quad",infofunct="vertcent",lambda=1000)
infoTheoreticGCM(g,mat.dist,coeff="exp",infofunct="degree",lambda=1000)
}
\keyword{ descriptors }
