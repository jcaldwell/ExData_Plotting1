#### Generate a histogram of Global Active Power
####

raw <- read.table("./household_power_consumption.txt", sep=";", header = TRUE,na.strings = "?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

##Date is in Day/Month/Year format
hpc <- subset(raw, Date=="1/2/2007" | Date=="2/2/2007")

png(filename = "plot1.png", width=480, height=480)
hist(hpc$Global_active_power, xlab = "Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()