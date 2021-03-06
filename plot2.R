data <- read.csv2("./household_power_consumption.txt", header = F, na.strings = "?", colClasses = "character", nrows = 2880, skip = 66637, quote = "")
s <- as.vector(read.csv2("./household_power_consumption.txt", header = F, colClasses = "character", nrows=1), mode = "character")
colnames(data) <- s
Timeval <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data <- data.frame(Timeval, lapply(data[, 3:9], as.numeric))
png(filename = "plot2.png")
with(data, plot(Timeval, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kiowatts)"))
dev.off()

