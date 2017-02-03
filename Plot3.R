unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip", exdir = "./")
power <- read.table("household_power_consumption.txt", header = T, 
                    sep = ";", na.strings = "?", 
                    colClasses = c("factor", "factor", "real", "real", "real", "real", "real", "real", "real"))
str(power2)
power$new_date <- as.Date(power$Date, "%d/%m/%Y")
library(dplyr)
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
power_subset <- filter(power, (new_date==date1 | new_date==date2))
power <- power_subset
rm(power_subset)

plot(power$new_time, power$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(power$new_time, power$Sub_metering_2, col = "red")
lines(power$new_time, power$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.cur()
dev.copy(png, file = "plot3.png")
dev.off()
