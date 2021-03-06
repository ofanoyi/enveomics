\name{plot.enve.GSS}
\alias{plot.enve.GSS}
\title{plot enve GSS}
\description{Plot an `enve.GSS` object.}
\usage{\method{plot}{enve.GSS}(x, new = TRUE, type = c("boxplot", "points"), col = "#00000044", 
    pt.cex = 1/2, pt.pch = 19, pt.col = col, ln.col = col, ...)}
\arguments{
  \item{x}{`enve.GSS` object to plot.}
  \item{new}{Should a new canvas be drawn?}
  \item{type}{Type of plot. The 'points' plot shows all the replicates, the 'boxplot' plot represents the values found by `boxplot.stats`
as areas, and plots the outliers as points.}
  \item{col}{Color of the areas and/or the points.}
  \item{pt.cex}{Size of the points.}
  \item{pt.pch}{Points character.}
  \item{pt.col}{Color of the points.}
  \item{ln.col}{Color of the lines.}
  \item{\dots}{Any additional parameters supported by `plot`.}
}



\author{Luis M. Rodriguez-R <lmrodriguezr@gmail.com> [aut, cre]}





