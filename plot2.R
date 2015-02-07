plot2 <- function() {
        fileName <- "./data/household_power_consumption.txt"
        if(file.exists(fileName)) {
                colClasses <- c(rep("character", 2), rep("numeric", 7))
                allData <- read.table(fileName, header = TRUE, sep = ";", colClasses = colClasses, na.strings = "?")
                data <- subset(allData, Date == "1/2/2007" | Date == "2/2/2007")
                data$DateTime <- paste(data$Date, data$Time)
                data$DateTime <- as.POSIXlt(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
                png("Plot 2.png")
                plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
                dev.off()
        }
}