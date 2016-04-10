### Exploratory Data Analysis Course Project 1 ###
### Plot the electric power consumption ###
### Joonsuk Hong ###

### 1. Reading data from the given text file. ###

whole.data <- read.table("~/Desktop/Coursera/exdata/project1/household_power_consumption.txt", 
                         header = TRUE, stringsAsFactors = FALSE, sep = ";", na.strings = "?")

### 2. Subsetting the data from 2007 FEB 1 thru 2007 FEB 2 ###
roi.data <- subset(whole.data, Date == "1/2/2007" | Date == "2/2/2007")

### 3. Converting integer Dates to actual Date. ###
roi.date <- strptime(paste(roi.data$Date, roi.data$Time, sep = ""), "%d/%m/%Y %H: %M: %S")

### 4. Converting required data into numeric values. ###
num.roi <- as.numeric(roi.data$Global_active_power)

vol.roi <- as.numeric(roi.data$Voltage)

sub1.roi <- as.numeric(roi.data$Sub_metering_1)
sub2.roi <- as.numeric(roi.data$Sub_metering_2)
sub3.roi <- as.numeric(roi.data$Sub_metering_3)

react.roi <- as.numeric(roi.data$Global_reactive_power)

### 5. Opeing a plot4.png. ###
png("plot4.png", width = 480, height = 480)

### 6. Setting up a global configuration of graphs. ###
par(mfrow = c(2, 2))

### 7. Graph 1: x-Date, y-Global Active Power. ###
plot(roi.date, num.roi, type = "l", xlab = "", ylab = "Global Active Power")

### 8. Graph 2: x-date, y-Voltage. ###
plot(roi.date, vol.roi, type = "l", xlab = "datetime", ylab = "Voltage")

### 9. Graph 3: x-date, y-Energy submetering. ###
plot(roi.date, sub1.roi, type = "l", xlab = "", ylab = "Energy sub metering")
lines(roi.date, sub2.roi, col = "red", type = "l")
lines(roi.date, sub3.roi, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2,
       col = c("black", "red", "blue"))

### 10. Graph 4: x-date, y-Global reactive power. ###
plot(roi.date, react.roi, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

### 11. Closing the file. ###
dev.off()