dat = read.csv('household_power_consumption.txt', skip = 21997, nrows = 2880, sep = ';', header = FALSE)

dat$V1 = as.Date(dat$V1, format = '%d/%m/%Y')

