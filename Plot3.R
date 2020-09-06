library(dplyr)
dta <- read.table("household_power_consumption.txt", header=T, sep=";",
                  dec=".", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')) %>%
        filter(Date %in% c("1/2/2007","2/2/2007"))

str(dta)
dateTime <- strptime(paste(dta$Date, dta$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
with(dta, {
        plot(dateTime, Sub_metering_1, type="l",
             ylab="Energy sub metering", xlab="")
        lines(dateTime, Sub_metering_2,col='Red')
        lines(dateTime, Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()