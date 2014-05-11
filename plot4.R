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
png('plot4.png', height=480, width=480)
par(mfrow=c(2,2))
### 1. plot - Global_active_power vs dateTime
plot(
     dataSubset$dateTime
   , dataSubset$Global_active_power
   , type = 'l'
   , xlab = ''
   , ylab = 'Global Active Power'
)
### 2. plot - Voltage vs dateTime
plot(
     dataSubset$dateTime
   , dataSubset$Voltage
   , type = 'l'
   , ylab = 'Voltage'
)
### 3. plot - Sub metering 1
plot(
     dataSubset$dateTime
   , dataSubset$Sub_metering_1
   , type = 'l'
   , xlab = ''
   , ylab = 'Energy sub metering'
)
### Append Sub metering 2 to 3. plot
points(
     dataSubset$dateTime
   , dataSubset$Sub_metering_2
   , type = 'l'
   , col = 'red'
)
### Append Sub metering 3 to 3. plot
points(
     dataSubset$dateTime
   , dataSubset$Sub_metering_3
   , type = 'l'
   , col = 'blue'
)
### Append legend to 3. plot
legend(
     'topright'
   , lty = 1 
   , col = c(  'black'
             , 'red'
             , 'blue'
   )
   , bty = 'n'
   , legend = c(  'Sub_metering_1'
                , 'Sub_metering_2'
                , 'Sub_metering_3'
   )
)
### 4. plot - Global Reactive Power vs dateTime
plot(
     dataSubset$dateTime
   , dataSubset$Global_reactive_power
   , type = 'l'
   , xlab = 'datetime'
   , ylab = 'Global_reactive_power'   
)
dev.off()
