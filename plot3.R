#load the data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#convert char to date
data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
# subset dates
data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))


# merge time with dates

Date_time <- paste(data$Date, data$Time)
data <- cbind(Date_time, data)
data$Date_time <- as.POSIXct(Date_time)

#create graph


with(data, {
    plot(Sub_metering_1~Date_time, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Date_time,col='Red')
    lines(Sub_metering_3~Date_time,col='Blue')
  })
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
