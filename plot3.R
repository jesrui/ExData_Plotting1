source('readData.R')

filename <- '../household_power_consumption.txt'
data <- get.power.consumption(filename)

# Plot 3
png(filename="plot3.png")
plot(data$DateTime, data$Sub_metering_1, type='n',
     xlab='', ylab='Energy sub metering')
legend('topright', col=c('black','red','blue'), pch='-', lwd=2,
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
dev.off()
