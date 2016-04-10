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

### 4. Converting the required data into numeric values. ###
sub1.roi <- as.numeric(roi.data$Sub_metering_1)
sub2.roi <- as.numeric(roi.data$Sub_metering_2)
sub3.roi <- as.numeric(roi.data$Sub_metering_3)

### 5. Opening a plot3.png. ###
png("plot3.png", width = 480, height = 480)

### 6. Plotting a Submetering 1. ###
plot(roi.date, sub1.roi, type = "l", xlab = "", ylab = "Energy sub metering")

### 7. And adding a Submetering 2. ###
lines(roi.date, sub2.roi, col = "red", type = "l")

### 8. Finally drawing a Submetering 3. ###
lines(roi.date, sub3.roi, col = "blue", type = "l")

### 9. Adding indices. ###
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2,
       col = c("black", "red", "blue"))

### 10. Closing the file. ###
dev.off()
