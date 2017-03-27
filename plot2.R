#load the data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#convert char to date
data$Date <- as.Date(t$Date, "%d/%m/%Y")
  
# subset dates
data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))


# merge time with dates

Date_time <- paste(data$Date, data$Time)
data <- cbind(Date_time, data)
data$Date_time <- as.POSIXct(Date_time)

#create graph

plot(data$Global_active_power~data$Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()