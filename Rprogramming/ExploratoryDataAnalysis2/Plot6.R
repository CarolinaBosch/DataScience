##
## Question 6
##
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
## sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes 
## over time in motor vehicle emissions?
##

## Using sugested code to load data
## Data files must be unzipped and available in the same directory

library(ggplot2)
library(plyr)
library(car)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_motor_LA_Bal <- NEI[(NEI$fips == "24510" | NEI$fips == "06037") & NEI$type == "ON-ROAD", ]
NEI_motor_LA_Bal$fips <- recode(NEI_motor_LA_Bal$fips, "24510 = 'Baltimore'; else = 'Los Angeles' ")

png("Plot6.png", width = 480, height = 480)

g <- ggplot(data = NEI_motor_LA_Bal, aes(x = factor(year), y = Emissions, fill = factor(fips))) + 
  geom_bar(stat = "identity", position = "dodge") + 
  xlab("Year") +
  ylab(expression("Total PM2.5 emission per year (Tons)")) + 
  scale_fill_discrete(name = "Location") +
  ggtitle("Emission from motor vehicle source per year") 

print(g)
dev.off()

