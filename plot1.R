# Plot 1
# load complete data
household <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";",
                        na.strings = "?", stringsAsFactors = FALSE)

# convert date and time column to date format
library(lubridate)
household$Date <- dmy(household$Date)
household$Time <- hms(household$Time)

# subset data to get only observations from 2007-02-01 and 2007-02-02
household <- subset(household, household$Date == "2007-02-01" | household$Date == "2007-02-02")

# open png device and name file
png(filename = "plot1.png", width = 480, height = 480)
# plot histogram of global active power, giving title and axes labels and setting color
hist(household$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col = "#FF3300")
# close device
dev.off()
