## Create plot1 on the screen
hist(t$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

## Save to the appropriate png file
dev.copy(png,"plot1.png", width=480, height=480)

## close device
dev.off()