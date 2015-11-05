# Read and prepare data for processing
dat = read.csv('household_power_consumption.txt', skip = 66637, nrows = 2880, sep = ';', header = FALSE)
names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1','Sub_metering_2', 'Sub_metering_3')
colnames(dat) <- names
dates = as.character(dat$Date)
times = as.character(dat$Time)
datetime = paste(dates,times)
dat$DateTime = strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

png(file = 'plot4.png', width=480, height=480)

par(mfrow=c(2,2))
# First plot
with(dat, plot(DateTime,Global_active_power,
     xlab = '',
     ylab = 'Global active Power',
     type='l'))

# Second plot
with(dat,plot(DateTime,Voltage,type='l'))

# Third plot
with(dat, plot(DateTime,Sub_metering_1,xlab = '',ylab = 'Energy sub metering',type='l'))
with(dat, lines(DateTime,Sub_metering_2,type='l',col = 'red'))
with(dat, lines(DateTime,Sub_metering_3,type='l',col = 'blue'))
legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'), lty = c(1,1,1),bty = 'n')

# Fourth plot
with(dat, plot(DateTime,Global_reactive_power,type='l'))

dev.off()