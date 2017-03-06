########################
##      plot3.R       ##    
########################

# Read Dat Set #
data1 <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

# collect only data between 2007-02-01 to 2007-02-02
data1$Date <- strptime(data1$Date, "%d/%m/%Y")
ind <- data1$Date <= as.POSIXlt("2007-02-02")
ind2 <- data1$Date >= as.POSIXlt("2007-02-01")
data2 <- data1[ind&ind2,]

# convert "global active power" to numeric #
sub1 <- as.numeric(as.character(data2$Sub_metering_1)) 
sub2 <- as.numeric(as.character(data2$Sub_metering_2))
sub3 <- as.numeric(as.character(data2$Sub_metering_3)) 

# convert "Date" and "Time" to POSIXlt
nday <- strptime(paste(as.character(data2$Date), data2$Time), "%Y-%m-%d %H:%M:%S")

# line-plot "date/time" vs "sub_metering_1 - 3"
plot(nday, sub1, type = "n",xlab = "", ylab = "Energy sub metering")
lines(nday, sub1, type = "l", col = "black")
lines(nday, sub2, type = "l", col = "red")
lines(nday, sub3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       x.intersp = 0.5, y.intersp = 0.5, cex = 0.7)

# create PNG outputs #
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()