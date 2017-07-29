## Coursera - Exploratory Data Analysis - Project 2
## Ashely Kelly, July 29, 2017
## Plot 4 Questions: 
## Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# Ensure that no dataset called NEI exists.
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}

# Ensure that no dataset called SCC exists.
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Merge the two data sets, and ensure that no dataset called NEISCC exists. 
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

# Load the ggplot2 library
library(ggplot2)

# Gather a subset of the NEI column where NEISCC$Short.Name = 'coal'.
coalMatches <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

# Calculate the sum of the aggregated data for Emissions based on year and subsetNEISCC.
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)

# Construct Plot 4, and place it in a .png file
png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()
