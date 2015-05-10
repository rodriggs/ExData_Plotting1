## The following loads the necessary data into the workspace
## First the working directory is changed to where the data is located

setwd("~/Documents/DATASETS")

## Here the entire data set is read in again selecting for the days that will be needed

data_full <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = FALSE, 
                      stringsAsFactors = FALSE, comment.char = "", quote = '\"')
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

## Here a subset is made of the data

data <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## The dates are converted using the aforementioned functions

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## The following generates plot 3
with(data, {
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       ylab = "Global Active Power (kilowatts)", 
       xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, cex = 0.75,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
