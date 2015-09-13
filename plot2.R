source('readData.R')

filename <- '../household_power_consumption.txt'
data <- get.power.consumption(filename)

# Plot 2
png(filename="plot2.png")
plot(data$DateTime, data$Global_active_power, type='n',
     xlab='', ylab='Global Active Power (kilowatts)')
lines(data$DateTime, data$Global_active_power)
dev.off()
