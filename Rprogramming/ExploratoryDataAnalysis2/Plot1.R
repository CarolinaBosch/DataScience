##
## Question 1
##
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base 
## plotting system, make a plot showing the total PM2.5 emission from all sources for 
## each of the years 1999, 2002, 2005, and 2008.
##

## Using sugested code to load data
## Data files must be unzipped and available in the same directory

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm25byyear <- aggregate(Emissions ~ year, NEI, sum)

png("Plot1.png", width = 480, height = 480)

barplot(height = pm25byyear$Emissions, 
        names.arg = pm25byyear$year, 
        col = "blue",
        xlab = "Years",
        main = expression("Total PM2.5 emissions from 1999 to 2008 in the USA"),
        ylab = expression("Total PM2.5 emissions (Tons)" ))

dev.off()