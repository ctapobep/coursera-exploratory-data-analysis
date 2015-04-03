library(lattice)
library(datasets)
# plots: xyplot (scatter), bwplot (box-n-whiskers), histogram, stripplot(boxplot with points)
# plots: dotplot (dots on 'violin strings'), splom (scatterplot matrix like 'pairs' in basic plotting)
# plots: levelplot, contourplot (plotting image data)
airquality = transform(airquality, Month = factor(Month))
plot = xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))
print(plot)

# with `panel` it's possible to control what happens in every part of the plot
xyplot(Ozone ~ Wind | Month, data = airquality, layout= c(5,1), panel = function(x, y, ...) {
  panel.xyplot(x, y, ...) # call a default function
  panel.abline(h = median(y, na.rm = TRUE), lty = 2) # add a horizontal line
  panel.lmline(x, y, col = 2)
})


library(nlme)
xyplot(weight ~ Time | Diet, BodyWeight)

