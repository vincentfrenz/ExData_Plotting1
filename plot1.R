# load packages
library(dplyr)
library(lubridate)

## set directory
setwd("~/GitHub/CourseProject1")

## load data
myData <- read.csv2("./exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, dec = ".", na.strings = "?")

# filter for relevant time period
TwoDaysData <- filter(myData, c(Date == "1/2/2007" | Date == "2/2/2007"))

TwoDaysData$Date = as.Date(TwoDaysData$Date, "%d/%m/%Y")

class(myData$Date)
?filter

