plot4 <- function() {
        fileName <- "./data/household_power_consumption.txt"
        if(file.exists(fileName)) {
                colClasses <- c(rep("character", 2), rep("numeric", 7))
                allData <- read.table(fileName, header = TRUE, sep = ";", colClasses = colClasses, na.strings = "?")
                data <- subset(allData, Date == "1/2/2007" | Date == "2/2/2007")
                data$DateTime <- paste(data$Date, data$Time)
                data$DateTime <- as.POSIXlt(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
                png("Plot 4.png")
                par(mfrow = c(2, 2))
                plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
                plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
                plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
                lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
                lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
                legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
                dev.off()
        }
}