# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission
# from all sources for each of the years 1999, 2002, 2005, and 2008.

pollution = readRDS("data/summarySCC_PM25.rds")
sumByYear = aggregate(list('Emissions' = pollution$Emissions), list('Year' = pollution$year), sum)
title(main = 'Total emissions per year')
plot(sumByYear, pch = 20)
abline(lm(sumByYear[,2] ~ sumByYear[,1]), lwd = 2)
dev.copy(png, file = "plot1.png")
dev.off()

