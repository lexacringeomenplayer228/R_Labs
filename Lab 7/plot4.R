NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- SCC[grep("Coal", SCC$SCC.Level.Three, ignore.case = T), ]

data <- merge(NEI, coal, by="SCC")

sums <- aggregate(Emissions~year, data, sum)

png("plot4.png", width=480, height=480)
plot(sums, type = "l", xlab = "Year", ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 from coal combustion-related sources in the U.S.", xaxt = "n")
axis(1, at = c(1999:2008), labels = c(1999:2008));
dev.off()
