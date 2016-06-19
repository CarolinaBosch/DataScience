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

##
## Saving the plot to a 480x480 png file
##

png ("Plot1.png", width = 480, height = 480)
hist(FilteredData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()