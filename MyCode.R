df <- read.csv("household_power_consumption.txt", sep = ";", na.string = "?",nrows = 120000, colClasses = c("character", "character", "numeric","numeric","numeric", "numeric", "numeric", "numeric", "numeric"))
df1 <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]

hist(df1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, "GlobalActivePowerHistogram.png")
dev.off()

df1$Time <- strptime(paste(df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S")
df1 <- df1[, names(df1) != "Date"]
with(df1, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, "GlobalActivePower_VS_Time.png")
dev.off()

plot(df1$Time, df1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df1$Time, df1$Sub_metering_2, col = "red")
lines(df1$Time, df1$Sub_metering_3, col = "blue")
legend("topright",lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "EnergySubMetering.png")
dev.off()

par(mfrow = c(2,2))
with(df1, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power"))
with(df1, plot(Time, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))
plot(df1$Time, df1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df1$Time, df1$Sub_metering_2, col = "red")
lines(df1$Time, df1$Sub_metering_3, col = "blue")
legend("topright",lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(df1, plot(Time, Global_reactive_power, xlab = "datetime", type = "l"))
dev.copy(png, "AllFigures.png")
dev.off()
