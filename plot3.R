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
png('plot3.png', height=480, width=480)
### Sub metering 1
plot(
     dataSubset$dateTime
   , dataSubset$Sub_metering_1
   , type = 'l'
   , xlab = ''
   , ylab = 'Energy sub metering'
   , col = 'black'
)
### Add Sub metering 2
points(
     dataSubset$dateTime
   , dataSubset$Sub_metering_2
   , type = 'l'
   , col = 'red'
)
### Add sub metering 3
points(
     dataSubset$dateTime
   , dataSubset$Sub_metering_3
   , type = 'l'
   , col = 'blue'
)
### Add legend
legend(
     'topright'
   , lty = 1
   , col = c(  'black'
             , 'red'
             , 'blue'
   )
   , legend = c(  'Sub_metering_1'
                , 'Sub_metering_2'
                , 'Sub_metering_3'
   )
)
dev.off()
