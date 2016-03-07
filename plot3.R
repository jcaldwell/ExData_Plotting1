
raw <- read.table("./household_power_consumption.txt", sep=";", header = TRUE,na.strings = "?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

##Date is in Day/Month/Year format
hpc <- subset(raw, Date=="1/2/2007" | Date=="2/2/2007")

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
png(filename = "plot3.png", width=480, height=480)

plot(as.POSIXct(paste(hpc$Date, hpc$Time)),hpc$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="", pch=20)
lines(as.POSIXct(paste(hpc$Date, hpc$Time)), hpc$Sub_metering_1)
lines(as.POSIXct(paste(hpc$Date, hpc$Time)), hpc$Sub_metering_2, col="red")
lines(as.POSIXct(paste(hpc$Date, hpc$Time)), hpc$Sub_metering_3, col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()