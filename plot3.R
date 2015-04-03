# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions from
# 1999–2008 for Baltimore City? Which have seen increases in emissions from
# 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
if(!require('ggplot2')){install.packages('ggplot2'); library('ggplot2')}
pollution = readRDS("data/summarySCC_PM25.rds")
pollution = subset(pollution, fips == '24510') # Baltimore
qplot(data = pollution, x = year, y = Emissions, color = type, geom = c('point', 'smooth'),
      method = 'lm', facets = . ~ type, ylim = c(NA, quantile(pollution$Emissions, 0.95)))
dev.copy(png, file = "plot3.png")
dev.off()
