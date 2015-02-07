plot1 <- function() {
        fileName <- "./data/household_power_consumption.txt"
        if(file.exists(fileName)) {
                colClasses <- c(rep("character", 2), rep("numeric", 7))
                allData <- read.table(fileName, header = TRUE, sep = ";", colClasses = colClasses, na.strings = "?")
                data <- subset(allData, Date == "1/2/2007" | Date == "2/2/2007")
                png("Plot 1.png")
                hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts", main = "Global Active Power")
                dev.off()
        }
}