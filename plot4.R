source('readData.R')

filename <- '../household_power_consumption.txt'
data <- get.power.consumption(filename)

# Plot 4
png(filename="plot4.png")
par(mfrow=c(2,2))
# Plot 4.1
plot(data$DateTime, data$Global_active_power, type='n',
     xlab='', ylab='Global Active Power')
lines(data$DateTime, data$Global_active_power)
# Plot 4.2
plot(data$DateTime, data$Voltage, type='n',
     xlab='datetime', ylab='Voltage')
lines(data$DateTime, data$Voltage)
# Plot 4.3
plot(data$DateTime, data$Sub_metering_1, type='n',
     xlab='', ylab='Energy sub metering')
legend('topright', col=c('black','red','blue'), bty='n', pch='-', lwd=2,
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
# Plot 4.4
plot(data$DateTime, data$Global_reactive_power, type='n',
     xlab='datetime', ylab='Global_reactive_power')
lines(data$DateTime, data$Global_reactive_power)
dev.off()
