# Compare emissions from motor vehicle sources in Baltimore City
# with emissions from motor vehicle sources in Los Angeles County,
# California (fips == 06037). Which city has seen greater changes
# over time in motor vehicle emissions?

require(ggplot2)
pollution = readRDS("data/summarySCC_PM25.rds")
vehiclePollution= subset(pollution, fips %in% c('24510', '06037') & type == 'ON-ROAD')
vehiclePollution$City = ifelse(vehiclePollution$fips == '24510', 'Baltimore', 'Los Angeles')

ggplot(data = vehiclePollution, aes(year, Emissions, color = City)) + geom_point() +
  geom_smooth(method = 'lm') + ylim(NA,quantile(vehiclePollution$Emissions, 0.95))

dev.copy(png, file = 'plot6.png')
dev.off()
