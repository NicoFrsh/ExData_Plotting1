# plot 4
# load complete data
household <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";",
                        na.strings = "?", stringsAsFactors = FALSE)

# convert date and time column to date format
library(lubridate)
household$Date <- dmy(household$Date)
household$Time <- hms(household$Time)

# subset data to get only observations from 2007-02-01 and 2007-02-02
household <- subset(household, household$Date == "2007-02-01" | household$Date == "2007-02-02")

# start png device
png(filename = "plot4.png")
# set plot parameters
par(mfrow=c(2,2))
# First plot
# plot the values of Global_active_power using type 'l' to plot lines. Name axes correspondingly.
plot(household$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power", xaxt = "none")
# add ticks to x axis with weekdays
axis(1, at = c(1, dim(household)[1]/2, dim(household)[1]),labels = c("Thu", "Fri","Sat"))

# Second Plot
# plot the values of Voltage using type 'l' to plot lines. Name axes correspondingly.
plot(household$Voltage, type = "l", xlab = "", xaxt = "none",
     ylab = "Voltage")
# add ticks to x axis with weekdays
axis(1, at = c(1, dim(household)[1]/2, dim(household)[1]),labels = c("Thu", "Fri","Sat"))

# Third Plot
# plot sub_metering_1 line first
plot(household$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering" ,xaxt = "none")
# add sub_metering_2 line
lines(household$Sub_metering_2, col = "red")
# add sub_metering_3 line
lines(household$Sub_metering_3, col = "blue")
# put weekdays on axis
axis(1, at = c(1, dim(household)[1]/2, dim(household)[1]),labels = c("Thu", "Fri","Sat"))
# add legend
legend("topright", col = c("black","red","blue"), lty = 1, bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Fourth Plot
# plot the values of Global_reactive_power using type 'l' to plot lines. Name axes correspondingly.
plot(household$Global_reactive_power, type = "o", xlab = "", xaxt = "none",
     ylab = "Global_reactive_power", pch = 20)
# add ticks to x axis with weekdays
axis(1, at = c(1, dim(household)[1]/2, dim(household)[1]),labels = c("Thu", "Fri","Sat"))
dev.off()
