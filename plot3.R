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
