##library
library(dplyr)
##library(ggplot2)

##load data
setwd("~/Coursera/4_Expl/4/Data")
NEI <- readRDS("summarySCC_PM25.rds")
setwd("~/Coursera/4_Expl/4")

##summarize data
mysub <- NEI %>% group_by(year) %>% summarise(totalemission = sum(Emissions))

##create graph
png('plot1.png', width = 480, height = 480)
plot(mysub, main = "Total yearly emissions in the USA", ylab = "PM2.5 emission", pch = 16)
dev.off()
