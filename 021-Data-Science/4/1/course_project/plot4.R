## Packages
library(utils)
library(dplyr)
library(readr)

## Download file and prepare date
url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url=url,destfile = 'data/pc.zip')
unzip('data/pc.zip', exdir='./data')
data <- read_delim('data/household_power_consumption.txt', 
                   delim=';', 
                   na = c('','?','NA'),
                   col_types = cols(Date = col_date('%d/%m/%Y'),
                                    Time = col_time(format = ""),
                                    Global_active_power = col_double(),
                                    Global_reactive_power = col_double(),
                                    Voltage = col_double(),
                                    Global_intensity = col_double(),
                                    Sub_metering_1 = col_double(),
                                    Sub_metering_2 = col_double(),
                                    Sub_metering_3 = col_double()))


data <- data %>% filter(Date == '2007-02-01' | Date == '2007-02-02') %>% 
    mutate(DateTime = parse_datetime(paste(Date,Time,sep = ' ')))

## Plot 4
png(filename = 'plot4.png')
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power,
     ylab = 'Global Active Power (kilowatts)',
     xlab = '',
     type = 'l')
plot(data$DateTime, data$Voltage,
     ylab = 'Voltage',
     xlab = 'datetime',
     type = 'l')
plot(data$DateTime,data$Sub_metering_1,
     type='l',
     xlab='',
     ylab='Energy sub metering')
lines(data$DateTime,data$Sub_metering_2, col='red')
lines(data$DateTime,data$Sub_metering_3, col='blue')
legend('topright',legend = c('Sub_metering_1',
                             'Sub_metering_2',
                             'Sub_metering_3'),
       col=c('black','red','blue'), lty=c(1,1,1))
plot(data$DateTime, data$Global_reactive_power,
     xlab = 'datetime',
     type = 'l')
dev.off()

