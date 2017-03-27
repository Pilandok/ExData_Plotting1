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





par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
    plot(Global_active_power~Date_time, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Date_time, type="l", 
         ylab="Voltage (volt)", xlab="datetime")
    plot(Sub_metering_1~Date_time, type="l", 
         ylab="Energy sub metering (kilowatts)", xlab="")
    lines(Sub_metering_2~Date_time,col='Red')
    lines(Sub_metering_3~Date_time,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Date_time, type="l", 
         ylab="Global Reactive Power (kilowatts)",xlab="datetime")
  })

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()