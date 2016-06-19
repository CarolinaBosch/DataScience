##
## Question 5
##
## How have emissions from motor vehicle source changed from 1999-2008 in Baltimore City?
##

## Using sugested code to load data
## Data files must be unzipped and available in the same directory

library(ggplot2)
library(plyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by = "SCC")

on_road <- NEISCC[NEISCC$fips == "24510" & NEISCC$type == "ON-ROAD",]

png("Plot5.png", width = 480, height = 480)

g <- ggplot(on_road, aes(x = factor(year), y = Emissions, fill = SCC.Level.Three))
g <- g + geom_bar(stat = "identity") + 
  xlab("Year") +
  ylab(expression("Total PM2.5 Emissions (Tons)")) +
  scale_fill_discrete(name = "Vehicle type source") +
  ggtitle("Emissions from motor vehicle source in Baltimore from 1999 to 2008")

print(g)
dev.off()
