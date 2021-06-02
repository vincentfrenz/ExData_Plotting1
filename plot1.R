## Plot 1 - RScript

## load packages
library(dplyr)

## set directory
setwd("~/GitHub/ExData_Plotting1")

## load data
myData <- read.csv2("./exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, dec = ".", na.strings = "?")

## filter for relevant time period
TwoDaysData <- filter(myData, c(Date == "1/2/2007" | Date == "2/2/2007"))

## plot
hist(TwoDaysData$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

## png
dev.copy(png, file = "plot1.png")
dev.off()
