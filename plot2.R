# Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting
# system to make a plot answering this question.

pollution = readRDS("data/summarySCC_PM25.rds")
pollution = subset(pollution, fips == '24510') # Baltimore
sumByYear = aggregate(list('Emissions' = pollution$Emissions), list('Year' = pollution$year), sum)
title(main = 'Total emissions per year')
plot(sumByYear, pch = 20)
abline(lm(sumByYear[,2] ~ sumByYear[,1]), lwd = 2)
dev.copy(png, file = "plot2.png")
dev.off()
