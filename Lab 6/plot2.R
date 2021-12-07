data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

lab <-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

lab$DateTime <- paste(lab$Date, lab$Time)
lab$DateTime <- strptime(lab$DateTime, "%d/%m/%Y %H:%M:%S")
lab$Date <- as.Date(lab$Date, "%d/%m/%Y")

png("plot2.png", width=480, height=480)
plot(lab$DateTime, lab$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
