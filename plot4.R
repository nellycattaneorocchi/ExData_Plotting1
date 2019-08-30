## Create Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(t, {
    plot(Global_active_power~dateTime, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~dateTime, type="l", 
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~dateTime, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~dateTime,col='Red')
    lines(Sub_metering_3~dateTime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), bty="n",
           legend=c("SM1 ", "SM2 ", "SM3 "))
    plot(Global_reactive_power~dateTime, type="l", 
         ylab="Global_reactive_power",xlab="datetime")
})

## Save to the appropriate png file
dev.copy(png,"plot4.png", width=480, height=480)

## close device
dev.off()