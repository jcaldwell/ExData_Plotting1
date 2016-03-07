
raw <- read.table("./household_power_consumption.txt", sep=";", header = TRUE,na.strings = "?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

##Date is in Day/Month/Year format
hpc <- subset(raw, Date=="1/2/2007" | Date=="2/2/2007")

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$timestamp <- as.POSIXct(paste(hpc$Date, hpc$Time))

png(filename = "plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(hpc$timestamp,hpc$Global_active_power,ylab="Global Active Power", xlab="",type="n")
lines(hpc$timestamp,hpc$Global_active_power)

plot(hpc$timestamp,hpc$Voltage, ylab="Voltage", xlab="", type="n")
lines(hpc$timestamp,hpc$Voltage)
title(sub="datetime")


plot(hpc$timestamp,hpc$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="", pch=20)
lines(hpc$timestamp, hpc$Sub_metering_1)
lines(hpc$timestamp, hpc$Sub_metering_2, col="red")
lines(hpc$timestamp, hpc$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

plot(hpc$timestamp,hpc$Global_reactive_power, ylab="Global_reactive_power", xlab="",type="n")
lines(hpc$timestamp,hpc$Global_reactive_power)
title(sub="datetime")

dev.off()
