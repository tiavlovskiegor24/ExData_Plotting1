# Exploratory Data Analysis Assignment 1
#Script for plot 1

#load the data.table package
library(data.table)

#read the data from the file in working directory into a dataset
all_data <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.strings = "?")

#subset only the 2007-02-01 and 2007-02-02 dates
data <- subset(all_data,Date == "1/2/2007" | Date == "2/2/2007")

#convert the Date and Time variables to Date/Time classes
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#create a histogram and save it to png file
png("plot1.png",width = 480,height = 480)
par(mfrow = c(1,1))
with(data,hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",main = "Global Active Power"))
dev.off()

