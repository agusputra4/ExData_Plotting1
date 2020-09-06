library(dplyr)
dta <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F,
                  dec=".", na.strings = "?") %>%
        filter(Date %in% c("1/2/2007","2/2/2007"))

str(dta)
datetime <- strptime(paste(dta$Date, dta$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
with(dta, plot(datetime, as.numeric(Global_active_power), type="l", xlab="", 
               ylab="Global Active Power (kilowatts)"))
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()