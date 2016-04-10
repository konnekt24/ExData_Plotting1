### Exploratory Data Analysis Course Project 1 ###
### Plot the electric power consumption ###
### Joonsuk Hong ###

### 1. Reading data from the given text file. ###

whole.data <- read.table("~/Desktop/Coursera/exdata/project1/household_power_consumption.txt", 
                         header = TRUE, stringsAsFactors = FALSE, sep = ";", na.strings = "?")

### 2. Subsetting the data from 2007 FEB 1 thru 2007 FEB 2 ###
roi.data <- subset(whole.data, Date == "1/2/2007" | Date == "2/2/2007")

### 3. For plotting, need to change data into numeric. ###
num.roi <- as.numeric(roi.data$Global_active_power)

### Open a png file. ###
png("plot1.png", width = 480, height = 480)

### 4. Plotting a histogram. ###
hist(num.roi, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

### 5. Closing the plot1.png. ###
dev.off()