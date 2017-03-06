########################
##      plot2.R       ##    
########################

# Read Dat Set #
data1 <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

# collect only data between 2007-02-01 to 2007-02-02
data1$Date <- strptime(data1$Date, "%d/%m/%Y")
ind <- data1$Date <= as.POSIXlt("2007-02-02")
ind2 <- data1$Date >= as.POSIXlt("2007-02-01")
data2 <- data1[ind&ind2,]

# convert "global active power" to numeric #
gap <- as.numeric(as.character(data2$Global_active_power)) 

# convert "Date" and "Time" to POSIXlt
nday <- strptime(paste(as.character(data2$Date), data2$Time), "%Y-%m-%d %H:%M:%S")

# line-plot "date/time" vs "global active power"
plot(nday, gap, type = "n",xlab = "", ylab = "Global Active Power (kilowatts)")
lines(nday, gap, type = "l")

# create PNG outputs #
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()