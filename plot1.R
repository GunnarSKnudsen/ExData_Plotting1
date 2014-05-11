## Working directory
setwd("~/Coursera/DataSciences/4ExploratoryDataAnalysis/Assignment1/ExData_Plotting1")

## Load data (downloaded using downloadData.R)
data <- read.table('data/household_power_consumption.txt'
                   , sep=';'
                   , header=TRUE
                   , na.strings='?'
)
## Add column for use in plot 2, 3 and 4
data$dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Understand data
#head(data)
#str(data)

## Select only relevant data
dataSubset <- subset(data, 
               as.Date(dateTime) >= as.Date("2007-02-01") & 
               as.Date(dateTime) <= as.Date("2007-02-02"))

## Generate plot
png('plot1.png', height=480, width=480)
hist(
       dataSubset$Global_active_power
     , col='red'
     , xlab = 'Global Active Power (kilowatts)'
     , main = 'Global Active Power'
)
dev.off()
