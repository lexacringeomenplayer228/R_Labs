data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

lab <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

lab$DateTime <- paste(lab$Date, lab$Time)
lab$DateTime <- strptime(lab$DateTime, "%d/%m/%Y %H:%M:%S")
lab$Date <- as.Date(lab$Date, "%d/%m/%Y")

png("plot3.png", width=480, height=480)
plot(lab$DateTime, lab$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(lab$DateTime, lab$Sub_metering_2, type = "l", col = "red")
lines(lab$DateTime, lab$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "))
dev.off()
