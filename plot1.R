## Exploratory Data Analysis
## Peer-graded Assignment: Course Project 1

## Plot 1

# Loading dplyr package

library(dplyr)

# Reading the data set

dataEPC <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
str(dataEPC)

# Converting the Date and Time variables to Date/Time classes in R

dataEPC <- mutate(dataEPC, Date = as.Date(Date, "%d/%m/%Y"))
dataEPC <- mutate(dataEPC, Time = strptime(dataEPC$Time, "%H:%M:%S"))

# Subsetting data set to dates required

dataEPC <- filter(dataEPC, Date == "2007-02-01" | Date == "2007-02-02")

# Plotting data to a png file

png(file="plot1.png", width=480, height=480)
hist(x = dataEPC$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red")
dev.off()


