## set he appropriate working directory
setwd("/cloud/project/coursera/04 Exploratory Data Analysis/Project 1")

t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
t$Date <- as.Date(t$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
t <- t[complete.cases(t),]

## Combine Date and Time column
dateTime <- paste(t$Date, t$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
t <- t[ ,!(names(t) %in% c("Date","Time"))]

## Add DateTime column
t <- cbind(dateTime, t)

## Format dateTime Column
t$dateTime <- as.POSIXct(dateTime)

## Create plot 3 on the screen
# create base plot on Sub_metering_1
plot(t$Sub_metering_1~t$dateTime, type="l",ylab="Energy sub metering", xlab="")
# add Sub_metering_2 in red
lines(t$Sub_metering_2~t$dateTime,col='Red')
# add Sub_metering_3 in blue
lines(t$Sub_metering_3~t$dateTime,col='Blue')
# add legend
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "))


## Save to the appropriate png file
dev.copy(png,"plot3.png", width=480, height=480)

## close device
dev.off()
