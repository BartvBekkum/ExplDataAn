##library
library(dplyr)
library(ggplot2)

##load data
setwd("~/Coursera/4_Expl/4/Data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
setwd("~/Coursera/4_Expl/4")

##filter and aggregate data
mtrvhcls <- SCC[grep("*Vehicle", SCC$SCC.Level.Two),  ]
bltmrset <- filter(NEI, fips == "24510")
mysub5 <- bltmrset[bltmrset$SCC %in% mtrvhcls$SCC, ]
mysubaggr5 <- mysub5 %>% group_by(year) %>% summarise(totalemission = sum(Emissions))

##create graph
png('plot5.png', width = 480, height = 480)
ggplot(mysubaggr5, aes(year, totalemission)) + geom_point() + geom_smooth()
dev.off()
