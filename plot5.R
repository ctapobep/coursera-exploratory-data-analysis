# How have emissions from motor vehicle sources changed from
# 1999–2008 in Baltimore City?

require(ggplot2)
pollution = readRDS("data/summarySCC_PM25.rds")
baltimoreVehiclePollution= subset(pollution, fips == '24510' & type == 'ON-ROAD')

qplot(data = baltimoreVehiclePollution, x = year, y = Emissions, geom = c('point', 'smooth'),
      method = 'lm', ylim = c(NA, quantile(baltimoreVehiclePollution$Emissions, 0.95)))
dev.copy(png, file = 'plot5.png')
dev.off()
