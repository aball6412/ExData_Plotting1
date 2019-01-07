library(tidyverse)
library(lubridate)
df <- read.delim('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE)

df <- df %>%
  mutate(datetime = as.POSIXct( paste(Date, Time), format = '%d/%m/%Y %H:%M:%S')) %>%
  select(-c(Date, Time)) %>%
  filter(datetime >= as.POSIXct('02-01-2007 00:00:00', format = '%m-%d-%Y %H:%M:%S') & datetime < as.POSIXct('02-03-2007 00:00:00', format = '%m-%d-%Y %H:%M:%S')) %>%
  select(datetime, everything())

with(df, plot(datetime, Global_active_power, type="n", ylab = 'Global Active Power (kilowatts)', xlab = ''))
lines(df$datetime, df$Global_active_power)
dev.copy(png, file = 'plot2.png')
dev.off()