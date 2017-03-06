########################
##      plot1.R       ##    
########################

# Read Data Set #
data1 <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

# collect only data between 2007-02-01 to 2007-02-02
data1$Date <- strptime(data1$Date, "%d/%m/%Y")
ind <- data1$Date <= as.POSIXlt("2007-02-02")
ind2 <- data1$Date >= as.POSIXlt("2007-02-01")
data2 <- data1[ind&ind2,]

# convert "global active power" to numeric #
gap <- as.numeric(as.character(data2$Global_active_power)) 

# plot histogram of "global active power"
hist(gap, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     main = "Global Active Power")

# create PNG outputs #
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
