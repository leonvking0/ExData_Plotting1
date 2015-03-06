## Prepare data
data <- read.csv2("household_power_consumption.txt", colClasses = "character")

## Convert date attribute and subset the data
data2 <- transform(data, Date = as.Date(Date, "%d/%m/%Y"))
data2 <- subset(data2, Date == "2007-02-01" | Date == "2007-02-02")

## Convert date and time to classes "POSIXlt" and "POSIXct" representing calendar dates and times
x <- paste(data2$Date, data2$Time)
data2 <- transform(data2, Time2 = strptime(x, "%Y-%m-%d %H:%M:%S"))


data2 <- transform(data2, 
					Global_active_power = as.numeric(data2$Global_active_power),
					Global_reactive_power = as.numeric(data2$Global_reactive_power),
					Voltage = as.numeric(data2$Voltage),
					Global_intensity = as.numeric(data2$Global_intensity),
					Sub_metering_1 = as.numeric(data2$Sub_metering_1),
					Sub_metering_2 = as.numeric(data2$Sub_metering_2),
					Sub_metering_3 = as.numeric(data2$Sub_metering_3)
					)

## Plot3
png(file = "plot3.png")
with(data2, {
plot(Time2, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(Time2, Sub_metering_2, type = "l", col = "red")
points(Time2, Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off() 