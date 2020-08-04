## Exploratory Data Analysis
## Peer-graded Assignment: Course Project 1

## Plot 2

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

png(file="plot2.png", width=480, height=480)
plot(x = dataEPC$DateTime,
     y = dataEPC$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")
dev.off()


