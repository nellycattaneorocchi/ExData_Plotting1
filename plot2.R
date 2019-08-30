## Create plot 2 on the screen
plot(t$Global_active_power~t$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save to the appropriate png file
dev.copy(png,"plot2.png", width=480, height=480)

## close device
dev.off()