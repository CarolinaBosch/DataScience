##
## Question 2
##
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.
##

## Using sugested code to load data
## Data files must be unzipped and available in the same directory

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- NEI[NEI$fips == "24510",]
pm25_Baltimore_by_year <- aggregate(Emissions~year, Baltimore, sum)

png("Plot2.png", width = 480, height = 480)

barplot(height = pm25_Baltimore_by_year$Emissions, 
        names.arg = pm25_Baltimore_by_year$year, 
        col = "red",
        xlab = "Years",
        main = expression("Total PM2.5 emissions in Baltimore, MD from 1999 to 2008"),
        ylab = expression("total PM2.5 emissions (Tons)"))

dev.off()