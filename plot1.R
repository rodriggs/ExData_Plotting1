## The following loads the necessary data into the workspace
## First the working directory is changed to where the data is located

setwd("~/Documents/DATASETS")

## Here the data is selected for only the two days that are necessary, 
## the columns are given names, and the separation by a semicolon is explicityly stated

hps <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(hps), value = TRUE), 
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   sep = ";", header = TRUE)

## The following generates plot 1

hist(data$Global_active_power, col = "red", main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")