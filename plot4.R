## Plot 4 - RScript

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
par(mar = c(4,4,1,1))
par(mfrow = c(2,2))
plot(TwoDaysData$DateTime, TwoDaysData$Global_active_power, xlab = "datetime", ylab = "Global Active Power", type = "l")

plot(TwoDaysData$DateTime, TwoDaysData$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

with(TwoDaysData, plot(TwoDaysData$DateTime, TwoDaysData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
with(points(TwoDaysData$DateTime, TwoDaysData$Sub_metering_2, xlab = "", ylab = "", type = "l", col = "red"))
with(points(TwoDaysData$DateTime, TwoDaysData$Sub_metering_3, xlab = "", ylab = "", type = "l", col = "blue"))
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(TwoDaysData$DateTime, TwoDaysData$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

## png
dev.copy(png, file = "plot4.png")
dev.off()

