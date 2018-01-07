##library
library(dplyr)
library(ggplot2)

##load data
setwd("~/Coursera/4_Expl/4/Data")
NEI <- readRDS("summarySCC_PM25.rds")
setwd("~/Coursera/4_Expl/4")

##filter and summarize data
mysub1 <- filter(NEI, fips == "24510")
mysub3 <- mysub1 %>% group_by(type, year) %>% summarise(totalemission = sum(Emissions))

##create graph
png('plot3.png', width = 480, height = 480)
qplot(year, totalemission, data = mysub3, facets = .~type,
      geom = c("point", "smooth"), method = "lm", formula = y~x,
      main = "Total yearly emission in the USA", ylab = "PM2.5 emission")
dev.off()
