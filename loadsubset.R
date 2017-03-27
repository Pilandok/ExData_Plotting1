#load the data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#convert char to date
data$Date <- as.Date(t$Date, "%d/%m/%Y")
  
# subset dates
data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
