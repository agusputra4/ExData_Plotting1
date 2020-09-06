library(dplyr)
dta <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F,
                  dec=".", na.strings = "?") %>%
        filter(Date %in% c("1/2/2007","2/2/2007"))
with(dta, hist(as.numeric(Global_active_power), col = "red", 
               xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()