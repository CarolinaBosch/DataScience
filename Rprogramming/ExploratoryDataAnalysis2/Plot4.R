##
## Question 4
##
## Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
##

## Using sugested code to load data
## Data files must be unzipped and available in the same directory

library(ggplot2)
library(plyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by = "SCC")

coal <- grepl("coal", NEISCC$Short.Name, ignore.case = TRUE)
NEISCC_coal <- NEISCC[coal,]
comb <- grepl("comb", NEISCC_coal$SCC.Level.One, ignore.case = TRUE)
NEISCC_coal <- NEISCC[comb,]

png("Plot4.png", width = 480, height = 480)

g <- ggplot(NEISCC_coal, aes(year, Emissions, fill = SCC.Level.One))
g <- g + geom_bar(stat = "identity") + 
  xlab("Year") + 
  ylab(expression("Total PM2.5 emissions (Tons)")) +
  scale_fill_discrete(name = "Combustion source") +
  ggtitle("Total PM2.5 coal combustions emissions from 1999 to 2008" )

print(g)
dev.off()
