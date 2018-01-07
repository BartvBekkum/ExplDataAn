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

btmset <- filter(NEI, fips == "24510")
btmmsr <- btmset[btmset$SCC %in% mtrvhcls$SCC, ]

lacset <- filter(NEI, fips == "06037")
lacmsr <- lacset[lacset$SCC %in% mtrvhcls$SCC, ]

ttlset <- rbind(btmset,lacset)
ttlagg <- ttlset %>% group_by(fips, year) %>% summarise(totalemission = sum(Emissions))

##create graph
png('plot6.png', width = 480, height = 480)
ggplot(ttlagg, aes(year, totalemission)) + facet_grid(.~fips) + geom_point() + geom_smooth(method = "lm", se = TRUE)
dev.off()



