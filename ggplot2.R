install.packages('ggplot2')
library(ggplot2)
str(mpg)

qplot(displ, hwy, color = drv, geom = c('point', 'smooth'), data = mpg)
qplot(displ, hwy, color = drv, geom = c('point', 'smooth'), method = 'lm', data = mpg)
qplot(hwy, fill = drv, data = mpg)
qplot(hwy, color = drv, data = mpg, geom = 'density')

# facet is like a panel in lattice.
#  `. ~ drv` - what should be a colum and what should be a row. Dot means nothing.
qplot(displ, hwy, data = mpg, facets = . ~ drv)
qplot(hwy, data = mpg, facets = drv ~ ., bindwidth = 2)

# low-level ggplot
g = ggplot(mpg, aes(displ, hwy))
summary(g)
g + geom_point(alpha = 1/2, aes(color = drv)) + geom_smooth(method = 'lm') +
  facet_grid(drv ~ .) + theme(legend.position = 'none') + theme_bw(base_family = 'Times') +
  labs(title = 'Cars')
