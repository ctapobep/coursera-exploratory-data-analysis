box = function(pollution) {
  #boxplot(pollution$pm25, col = 'blue')
  boxplot(pm25 ~ region, data = pollution, col = 'red')
  abline(h = 12)
}

bar = function(pollution) {
  barplot(table(pollution$region), col = 'wheat',
          main = "Number of counties in Each Region")
}

histo = function(pollution) {
  par(mfrow = c(2,1), mar = c(4, 4, 2,1))
  hist(subset(pollution, region == 'east')$pm25, col = 'green')
  hist(subset(pollution, region == 'west')$pm25, col = 'green')
  #hist(pollution$pm25, col = 'green', breaks = 50)
  #rug(pollution$pm25)
}

scatter = function(pollution) {
  par(mfrow = c(1,2), mar = c(5,4,2,1))
  with(subset(pollution, region == 'west'), plot(latitude, pm25, main = 'West'))
  with(subset(pollution, region == 'east'), plot(latitude, pm25, main = 'East'))
  abline(h = 12, lwd = 2, lty = 2)
}

pollution = read.csv('data/avgpm25.csv', colClasses =
                       c('numeric', 'character', 'factor', 'numeric', 'numeric'))
summary(pollution$pm25)
#box(pollution)
histo(pollution)
#bar(pollution)
#scatter(pollution)
