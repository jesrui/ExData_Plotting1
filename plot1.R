filename <- '../household_power_consumption.txt'
numrows <- 2075259
#numrows <- 20
data <- read.table(filename, header=TRUE, nrows=numrows, sep=';',
                   na.strings='?', comment.char='', stringsAsFactors=FALSE,
                   colClasses=c('character','character',
                                'numeric','numeric','numeric',
                                'numeric','numeric','numeric','numeric'))

#data$Date <- as.POSIXlt(data$Date)
#data$Time <- as.POSIXlt(data$Time)


data$DateTime <- as.POSIXct(strptime(paste(data$Date,data$Time),
                                     "%d/%m/%Y %H:%M:%S"))

data1 <- data[data$DateTime >= as.POSIXct('2007-02-01') &
             data$DateTime < as.POSIXct('2007-02-03'), ]

# Plot 1
png(filename="plot1.png")
hist(data1$Global_active_power,col='red',
     xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()

# Plot 2
png(filename="plot2.png")
plot(data1$DateTime, data1$Global_active_power, type='n',
     xlab='', ylab='Global Active Power (kilowatts)')
lines(data1$DateTime, data1$Global_active_power)
dev.off()

# Plot 3
png(filename="plot3.png")
plot(data1$DateTime, data1$Sub_metering_1, type='n',
     xlab='', ylab='Energy sub metering')
legend('topright', col=c('black','red','blue'), pch='-', lwd=2,
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
lines(data1$DateTime, data1$Sub_metering_1)
lines(data1$DateTime, data1$Sub_metering_2, col='red')
lines(data1$DateTime, data1$Sub_metering_3, col='blue')
dev.off()

# Plot 4
png(filename="plot4.png")
par(mfrow=c(2,2))
# Plot 4.1
plot(data1$DateTime, data1$Global_active_power, type='n',
     xlab='', ylab='Global Active Power')
lines(data1$DateTime, data1$Global_active_power)
# Plot 4.2
plot(data1$DateTime, data1$Voltage, type='n',
     xlab='datetime', ylab='Voltage')
lines(data1$DateTime, data1$Voltage)
# Plot 4.3
plot(data1$DateTime, data1$Sub_metering_1, type='n',
     xlab='', ylab='Energy sub metering')
legend('topright', col=c('black','red','blue'), bty='n', pch='-', lwd=2,
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
lines(data1$DateTime, data1$Sub_metering_1)
lines(data1$DateTime, data1$Sub_metering_2, col='red')
lines(data1$DateTime, data1$Sub_metering_3, col='blue')
# Plot 4.4
plot(data1$DateTime, data1$Global_reactive_power, type='n',
     xlab='datetime', ylab='Global_reactive_power')
lines(data1$DateTime, data1$Global_reactive_power)
dev.off()



