setwd("~/Coursera/DataSciences/4ExploratoryDataAnalysis/Assignment1/ExData_Plotting1")
   

if(!file.exists("data")){
   dir.create("data")
}

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(
   url
   , 'data/dataSet.zip', 
   method='curl')

unzip('data/dataSet.zip')