data <- read.csv2("./household_power_consumption.txt", header = F, na.strings = "?", colClasses = "character", nrows = 2880, skip = 66637, quote = "")
s <- as.vector(read.csv2("./household_power_consumption.txt", header = F, colClasses = "character", nrows=1), mode = "character")
colnames(data) <- s
Timeval <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data <- data.frame(Timeval, lapply(data[, 3:9], as.numeric))
png(filename = "plot3.png")
with(data, plot(Timeval, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
with(data, lines(Timeval, Sub_metering_2, type = "l", col = "red"))
with(data, lines(Timeval, Sub_metering_3, type = "l", col = "blue"))
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

