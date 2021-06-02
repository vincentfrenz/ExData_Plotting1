## Plot 2 - RScript

## load packages
library(dplyr)
library(lubridate)

## set directory
setwd("~/GitHub/ExData_Plotting1")

## load data
myData <- read.csv2("./exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, dec = ".", na.strings = "?")

## filter for relevant time period
TwoDaysData <- filter(myData, c(Date == "1/2/2007" | Date == "2/2/2007"))

## format date and time
TwoDaysData$Date <- as.Date(TwoDaysData$Date, "%d/%m/%Y")

## store DateTime
TwoDaysData$DateTime <- paste(TwoDaysData$Date, TwoDaysData$Time)
TwoDaysData$DateTime <- as.POSIXct(TwoDaysData$DateTime)


## plot
plot(TwoDaysData$DateTime, TwoDaysData$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

## png
dev.copy(png, file = "plot2.png")
dev.off()
