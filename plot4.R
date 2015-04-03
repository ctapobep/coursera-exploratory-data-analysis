# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999–2008?
library(ggplot2)
scc = readRDS('data/Source_Classification_Code.rds')
coalScc = scc[grep('pulverized coal', scc$Short.Name, ignore.case = TRUE),]
pollution = readRDS('data/summarySCC_PM25.rds')
coalPollution = subset(pollution, pollution$SCC %in% coalScc$SCC)

qplot(data = coalPollution, x = year, y = Emissions, geom = c('point', 'smooth'),
      method = 'lm', ylim = c(NA, quantile(coalPollution$Emissions, 0.95)))
dev.copy(png, file = 'plot4.png')
dev.off()
