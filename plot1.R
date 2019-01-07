library(tidyverse)
library(lubridate)
df <- read.delim('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE)

df <- df %>%
  mutate(datetime = as.POSIXct( paste(Date, Time), format = '%d/%m/%Y %H:%M:%S')) %>%
  select(-c(Date, Time)) %>%
  filter(datetime >= as.POSIXct('02-01-2007 00:00:00', format = '%m-%d-%Y %H:%M:%S') & datetime < as.POSIXct('02-03-2007 00:00:00', format = '%m-%d-%Y %H:%M:%S')) %>%
  select(datetime, everything())

df$Global_active_power <- as.double(df$Global_active_power)
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")