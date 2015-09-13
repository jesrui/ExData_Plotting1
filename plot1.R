source('readData.R')

filename <- '../household_power_consumption.txt'
data <- get.power.consumption(filename)

# Plot 1
png(filename="plot1.png")
hist(data$Global_active_power,col='red',
     xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()
