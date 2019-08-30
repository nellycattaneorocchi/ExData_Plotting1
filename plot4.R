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

## Create Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(t, {
    plot(Global_active_power~dateTime, type="l", ylab="Global Active Power", xlab="")
    plot(Voltage~dateTime, type="l", ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~dateTime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~dateTime,col='Red')
    lines(Sub_metering_3~dateTime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), bty="n", legend=c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "))
    plot(Global_reactive_power~dateTime, type="l", ylab="Global_reactive_power",xlab="datetime")
})

## Save to the appropriate png file
dev.copy(png,"plot4.png", width=480, height=480)

## close device
dev.off()
