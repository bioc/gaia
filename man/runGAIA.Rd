\name{runGAIA}
\alias{runGAIA}
\title{Run GAIA algorithm.}
\description{
This function assess the significance of the chromosomal aberrations. Note that it uses the package qvalue.
}
\usage{
runGAIA(cnv_obj, markers_obj, output_file_name, aberrations = -1, chromosomes = -1, num_iterations = 10, threshold = 0.25, hom_threshold = 0.12, approximation=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cnv_obj}{an object returned by the function \code{load_cnv} describing the observed data.}
  \item{markers_obj}{an object returned by the function \code{load_markers} describing the observed markers.}
  \item{output_file_name}{the name of the file in which the significant aberrant regions are saved.}
  \item{aberrations}{[default=-1] the aberrations that will be analyzed. If it setted as -1 (default value) all aberrations will be analyzed.}
  \item{chromosomes}{[default=-1] the chromosomes that will be analyzed. If it setted as -1 (default value) all chromosomes will be analyzed.}
  \item{num_iterations}{[default=10] if the number of permutation steps (if approximation is equal to -1) - the number of column of the approximation matrix (if approximation is different to -1).}
  \item{threshold}{[default=0.25] markers having q-value lower than this threshold are labeled as significantly aberrant.}
  \item{hom_threshold}{[default=0.12] Threshold used for homogeneous peel-off. For values lower then 0 homogeneous peel-off is disabled.}
  \item{approximation}{[default=FALSE] if approximation is FALSE then GAIA explicitly performs the permutations, if it is TRUE then GAIA uses an approximated approach to compute the null distribution.}
}
%\details{}
\value{
	This function return a matrix containing all significant aberrant regions.
}
\references{
GAIA home page: http://www.dsba.unisannio.it/Members/ceccarelli/GAIA
}
\author{Sandro Morganella et al.

Maintainer: S. Morganella <morganellaalx@gmail.com>
}
\note{
In order to execute this script you need of the R package \code{qvalue} available at the bioconductor repository.\cr
To install the \code{qvalue} package, start R and enter:\cr
if (!requireNamespace("BiocManager", quietly=TRUE))\cr
    install.packages("BiocManager")\cr
BiocManager::install("qvalue")
}

%\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }

\examples{
# Load the matrix containing the informations about the markers
data(synthMarkers_Matrix)

# Use the function load_markers to obtain the marker descriptor data object
markers_obj <- load_markers(synthMarkers_Matrix)

# Load the matrix containing the informations about the aberrant regions
data(synthCNV_Matrix)

# Use the function load_cnv to obtain the aberrant region descriptor data object
cnv_obj <- load_cnv(synthCNV_Matrix, markers_obj, 10)

# run GAIA algorithm and save the results within the file "results.txt"
runGAIA(cnv_obj, markers_obj, "results.txt")

# run GAIA algorithm in its approximated version generating 5000 approximations
runGAIA(cnv_obj, markers_obj, "results.txt", num_iterations=5000, approximation=TRUE)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.



