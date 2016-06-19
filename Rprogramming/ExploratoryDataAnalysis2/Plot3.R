##
## Question 3
##
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
##

## Using sugested code to load data
## Data files must be unzipped and available in the same directory

library(ggplot2)
library(plyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- NEI[NEI$fips == "24510",]
pm25_Baltimore_by_type_by_year <- aggregate(Emissions ~ year + type, Baltimore, sum)

png("Plot3.png", width = 480, height = 480)

g <- ggplot(pm25_Baltimore_by_type_by_year, aes(x = factor(year), y = Emissions, fill = type))
g <- g + geom_bar(stat = "identity") + 
  xlab("Year") + 
  ylab(expression(" Total PM2.5 emissions (Tons)")) +
  scale_fill_discrete(name = "Source Type") +
  ggtitle("Total PM2.5 emissions in Baltimore, MD from 1999 to 2008 by source type")

print(g)
dev.off()
