


raw <- read.table("./household_power_consumption.txt", sep=";", header = TRUE,na.strings = "?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

##Date is in Day/Month/Year format
hpc <- subset(raw, Date=="1/2/2007" | Date=="2/2/2007")

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

png(filename = "plot2.png", width=480, height=480)
plot(as.POSIXct(paste(hpc$Date, hpc$Time)), hpc$Global_active_power, pch=20, type="n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(as.POSIXct(paste(hpc$Date, hpc$Time)), hpc$Global_active_power)
dev.off()