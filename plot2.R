# plot 2
# load complete data
household <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";",
                        na.strings = "?", stringsAsFactors = FALSE)

# convert date and time column to date format
library(lubridate)
household$Date <- dmy(household$Date)
household$Time <- hms(household$Time)

# subset data to get only observations from 2007-02-01 and 2007-02-02
household <- subset(household, household$Date == "2007-02-01" | household$Date == "2007-02-02")

# check which weekday is the first entry
weekdays(household$Date[1]) # -> thursday

# so the plot seems to show the global active power values from Thursday 2007-02-01 00:00:00
# until friday 2007-02-02 23:59:59
# open png device and name file
png(filename = "plot2.png")
# plot the values of Global_active_power using type 'l' to plot lines. Name axes correspondingly.
plot(household$Global_active_power, type = "l", xlab = "",
                     ylab = "Global Active Power (kilowatts)", xaxt = "none")
# add ticks to x axis with weekdays
axis(1, at = c(1, 2880/2, 2880),labels = c("Thu", "Fri","Sat"))
# close device
dev.off()

