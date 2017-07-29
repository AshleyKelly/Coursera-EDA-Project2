## Coursera - Exploratory Data Analysis - Project 2
## Ashely Kelly, July 29, 2017
## Plot 3 Questions: 
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
## Which have seen increases in emissions from 1999 2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

# Ensure that no dataset called NEI exists.
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}

# Ensure that no dataset called SCC exists.
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Load the ggplot2 library
library(ggplot2)

# Gather a subset of the NEI column where fips = 24510.
subsetNEI <- NEI[NEI$fips=="24510", ]

# Calculate the sum of the aggregated data for Emissions based on year and type and subsetNEI.
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

# Construct Plot 3, and place it in a .png file
png("plot3.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()
