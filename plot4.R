## Exploratory Data Analysis
## Peer-graded Assignment: Course Project 1

## Plot 4

# Loading dplyr and lubridate package

library(dplyr)
library(lubridate)

# Reading the data set

dataEPC <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
str(dataEPC)

# Converting the Date and Time variables to Date/Time classes in R and creating DateTime variable

dataEPC$DateTime <- with(dataEPC, dmy(Date) + hms(Time))
dataEPC <- mutate(dataEPC, Date = dmy(Date))
dataEPC <- mutate(dataEPC, Time = hms(Time))

# Subsetting data set to dates required

dataEPC <- filter(dataEPC, Date == "2007-02-01" | Date == "2007-02-02")

# Plotting data to a png file

png(file="plot4.png", width=480, height=480)
par(mfrow = c(2,2))

# Top-left plot
plot(x = dataEPC$DateTime,
     y = dataEPC$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     type = "l")
# Top-right plot
plot(x = dataEPC$DateTime,
     y = dataEPC$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")
# Bottom-left plot
plot(x = dataEPC$DateTime,
     y = dataEPC$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type = "l")
points(x = dataEPC$DateTime,
       y = dataEPC$Sub_metering_2,
       type = "l",
       col = "red")
points(x = dataEPC$DateTime,
       y = dataEPC$Sub_metering_3,
       type = "l",
       col = "blue")
legend("topright",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1)
# Bottom-right plot
plot(x = dataEPC$DateTime,
     y = dataEPC$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")
dev.off()


