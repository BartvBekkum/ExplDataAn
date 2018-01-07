##library
library(dplyr)
##library(ggplot2)

##load data
setwd("~/Coursera/4_Expl/4/Data")
NEI <- readRDS("summarySCC_PM25.rds")
setwd("~/Coursera/4_Expl/4")

##filter and summarize data
mysub1 <- filter(NEI, fips == "24510")
mysub2 <- mysub1 %>% group_by(year) %>% summarise(totalemission = sum(Emissions))
                   
##create graph
png('plot2.png', width = 480, height = 480)
plot(mysub2)  
dev.off()
