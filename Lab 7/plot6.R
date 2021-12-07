NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- SCC[grep("Vehicle", SCC$SCC.Level.Three, ignore.case = T), ]
data1 <- merge(NEI, data, by="SCC")

LA <- subset(data1, fips=="24510" | fips=="06037")
sumsLA <- aggregate(Emissions~fips+year, LA, sum)

png("plot6.png", width=480, height=480)
ggplot(sumsLA, aes(year, Emissions)) + geom_line(aes(color=fips)) + geom_point(aes(color=fips)) + labs(title = "Total Emissions of PM2.5 from Motor Vehicle Sources in Baltimore, Maryland and Los Angeles, California") + labs(x = "Year", y = "Emissions of PM2.5 (tons)") + scale_color_discrete(name = "Fips", labels = c("Los Angeles", "Baltimore"))
dev.off()
