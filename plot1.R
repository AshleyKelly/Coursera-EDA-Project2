## Coursera - Exploratory Data Analysis - Project 2
## Ashely Kelly, July 29, 2017
## Plot 1 Question:
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
## for each of the years 1999, 2002, 2005, and 2008.

# Ensure that no dataset called NEI exists.
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}

# Ensure that no dataset called SCC exists.
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Calculate the sum of the aggregated data for Emissions based on year and NEI.
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

# Construct Plot 1, and place it in a .png file
png('plot1.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years",
        ylab=expression('total PM'[2.5]*' emission'), main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()