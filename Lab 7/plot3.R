library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

sums3 <- aggregate(Emissions~fips+type+year, NEI, sum)
Baltimore <- subset(sums3, fips=="24510")
png("plot3.png", width=480, height=480)
qplot(x=year, y=Emissions, data=Baltimore, facets=.~type, geom = c("point", "line"), xlab = "Year", ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 by the Type of Source in Baltimore, Maryland", color=type)
dev.off()
