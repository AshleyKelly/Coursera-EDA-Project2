## Coursera - Exploratory Data Analysis - Project 2
## Ashely Kelly, July 29, 2017
## Plot 2 Question: 
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

# Ensure that no dataset called NEI exists.
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}

# Ensure that no dataset called SCC exists.
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Gather a subset of the NEI column where fips = 24510.
subsetNEI <- NEI[NEI$fips=="24510", ]

# Calculate the sum of the aggregated data for Emissions based on year and subsetNEI.
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

# Construct Plot 2, and place it in a .png file
png('plot2.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years",
        ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()