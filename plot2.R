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

### 4. For plotting, need to change data into numeric. ###
num.roi <- as.numeric(roi.data$Global_active_power)

### 5. Open a plot2.png. ###
png("plot2.png", width = 480, height = 480)

### 6. Plotting a graph. ###
plot(roi.date, num.roi, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

### 7. Closing the file.
dev.off()
