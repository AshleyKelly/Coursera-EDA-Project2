## Coursera - Exploratory Data Analysis - Project 2
## Ashely Kelly, July 29, 2017
# Plot 5 Question: 
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Ensure that no dataset called NEI exists.
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}

# Ensure that no dataset called SCC exists.
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Merge the two data sets 
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

# Load the ggplot2 library
library(ggplot2)

# Gather a subset of the NEI data where fips = 24510 and type = "ON-ROAD".
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

# Calculate the sum of the aggregated data for Emissions based on year and subsetNEI.
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

# Construct Plot 5, and place it in a .png file
png("plot5.png", width=840, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()
