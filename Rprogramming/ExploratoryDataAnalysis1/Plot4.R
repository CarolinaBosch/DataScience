##
## Script for generating Plots for houseshold power consumption
##

RawData <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?")

##
## Filtering the data to work with
##

FilteredData <- subset(RawData, Date == "1/2/2007" | Date == "2/2/2007")

##
## Modifying fields to fit my plotting needs
##

FilteredData$Datetime <- strptime(paste(FilteredData$Date, FilteredData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
FilteredData$Global_active_power <- as.numeric(FilteredData$Global_active_power)
FilteredData$Sub_metering_1 <- as.numeric(FilteredData$Sub_metering_1)
FilteredData$Sub_metering_2 <- as.numeric(FilteredData$Sub_metering_2)
FilteredData$Sub_metering_3 <- as.numeric(FilteredData$Sub_metering_3)
FilteredData$Global_reactive_power <- as.numeric(FilteredData$Global_reactive_power)
FilteredData$Voltage <- as.numeric(FilteredData$Voltage)

##
## Saving the plot to a 480x480 png file
##

png ("Plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(FilteredData$Datetime, FilteredData$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex = 0.2)
plot(FilteredData$Datetime, FilteredData$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(FilteredData$Datetime, FilteredData$Sub_metering_1, type="l", xlab="", ylab="Global Active Power")
lines(FilteredData$Datetime, FilteredData$Sub_metering_2, col='Red', type="l")
lines(FilteredData$Datetime, FilteredData$Sub_metering_3, col='Blue', type="l")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(FilteredData$Datetime, FilteredData$Global_reactive_power, type="l", ylab="Global Reactive Power",xlab="datetime")

dev.off()