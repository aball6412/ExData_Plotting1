library(tidyverse)
library(lubridate)
df <- read.delim('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE)

df <- df %>%
  mutate(datetime = as.POSIXct( paste(Date, Time), format = '%d/%m/%Y %H:%M:%S')) %>%
  select(-c(Date, Time)) %>%
  filter(datetime >= as.POSIXct('02-01-2007 00:00:00', format = '%m-%d-%Y %H:%M:%S') & datetime < as.POSIXct('02-03-2007 00:00:00', format = '%m-%d-%Y %H:%M:%S')) %>%
  select(datetime, everything())

with(df, plot(datetime, Sub_metering_1, type="n", ylab = 'Energy sub metering', xlab = ''))
lines(df$datetime, df$Sub_metering_1)
lines(df$datetime, df$Sub_metering_2, col = 'red')
lines(df$datetime, df$Sub_metering_3, col = 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.copy(png, file = 'plot3.png')
dev.off()