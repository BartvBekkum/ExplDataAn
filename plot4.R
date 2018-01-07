##library
library(dplyr)
library(ggplot2)

##load data
setwd("~/Coursera/4_Expl/4/Data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
setwd("~/Coursera/4_Expl/4")

##subset and aggregate data
coalcombset <- SCC[grep("Comb.*Coal", SCC$Short.Name, ignore.case = FALSE),  ]
mysub4 <- NEI[NEI$SCC %in% coalcombset$SCC, ]
mysubaggr <- mysub4 %>% group_by(year) %>% summarise(totalemission = sum(Emissions))

##create graph
png('plot4.png', width = 480, height = 480)
plot(mysubaggr)
dev.off()
