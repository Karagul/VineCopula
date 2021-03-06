#' Kernel estimate of  a Bivariate Copula Density
#'
#' A kernel density estimate of the copula density is visualized. The function
#' provides the same options as \code{\link{plot.BiCop}}. Further arguments can
#' be passed to \code{\link[kdecopula]{kdecop}} to modify the estimate.
#'
#' @param u1,u2 numeric vectors of equal length with values in [0,1].
#' @param type plot type; either \code{"contour"} or \code{"surface"} (partial
#' matching is activated) for a contour or perspective/surface plot
#' respectively.
#' @param margins only relevant for types \code{"contour"} and
#' \code{"surface"}; options are: \code{"unif"} for the original copula density,
#' \code{"norm"} for the transformed density with standard normal margins,
#' \code{"exp"} with standard exponential margins, and  \code{"flexp"} with
#' flipped exponential margins. Default is \code{"norm"} for \code{type =
#' "contour"}, and \code{"unif"} for \code{type = "surface"}.
#' \code{"norm"} for the transformed density with standard normal margins
#' (partial matching is activated). Default is \code{"norm"} for \code{type =
#' "contour"}, and \code{"unif"} for \code{type = "surface"}.
#' @param size integer; the plot is based on values on a \code{size x size}
#' grid; default is 100 for \code{type = "contour"}, and 25 for \code{type =
#' "surface"}.
#' @param kde.pars list of arguments passed to
#'  \code{\link[kdecopula]{kdecop}}.
#' @param \dots optional arguments passed to \code{\link{contour}} or
#' \code{\link{wireframe}}.
#'
#' @details
#' For further details on estimation see \code{\link[kdecopula]{kdecop}}.
#'
#' @author Thomas Nagler
#'
#' @examples
#' # simulate data from Joe copula
#' cop <- BiCop(3, tau = 0.3)
#' u <- BiCopSim(1000, cop)
#' contour(cop)  # true contours
#'
#' # kernel contours with standard normal margins
#' BiCopKDE(u[, 1], u[, 2])
#' BiCopKDE(u[, 1], u[, 2], kde.pars = list(mult = 0.5))  # undersmooth
#' BiCopKDE(u[, 1], u[, 2], kde.pars = list(mult = 2))  # oversmooth
#'
#' # kernel density with uniform margins
#' BiCopKDE(u[, 1], u[, 2], type = "surface", zlim = c(0, 4))
#' plot(cop, zlim = c(0, 4))  # true density
#'
#' # kernel contours are also used in pairs.copuladata
#' \donttest{data(daxreturns)
#' data <- as.copuladata(daxreturns)
#' pairs(data[c(4, 5, 14, 15)])}
#'
BiCopKDE <- function(u1, u2, type = "contour", margins, size,
                     kde.pars = list(), ...) {
    ## preprocessing of arguments
    args <- preproc(c(as.list(environment()), call = match.call()),
                    check_u,
                    remove_nas,
                    check_if_01,
                    na.txt = " Only complete observations are used.")
    list2env(args, environment())

    ## prepare the data for usage with plot.kdecopula function
    args <- list(udata = cbind(u1, u2))
    if (all(colnames(args$udata) == c("u1", "u2")))
        args$udata <- unname(args$udata)

    ## estimate copula density with kde.pars
    args <- modifyList(args, kde.pars)
    est <- do.call(kdecopula::kdecop, args)

    ## choose margins if missing
    if (missing(margins)) {
        margins <- switch(type,
                          "contour" = "norm",
                          "surface" = "unif")
    }

    # plot
    return(plot(est,
                type = type,
                margins = margins,
                size = size,
                ...))
}
