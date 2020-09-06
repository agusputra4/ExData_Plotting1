library(dplyr)
dta <- read.table("household_power_consumption.txt", header=T, sep=";",
                  dec=".", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')) %>%
        filter(Date %in% c("1/2/2007","2/2/2007"))

str(dta)
dateTime <- strptime(paste(dta$Date, dta$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dta, {
        plot(dateTime, Global_active_power, type="l", 
             ylab="Global Active Power", xlab="")
        plot(dateTime, Voltage, type="l", 
             ylab="Voltage", xlab="datetime")
        plot(dateTime, Sub_metering_1, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(dateTime, Sub_metering_2,col='Red')
        lines(dateTime, Sub_metering_3,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(dateTime, Global_reactive_power, type="l", 
             xlab="datetime")
})
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()