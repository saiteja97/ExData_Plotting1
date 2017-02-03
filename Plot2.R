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
power$new_time <- sub(".* ", "", strptime(power_subset$Time, format = "%H:%M:%S"))
power$new_time
power$new_time <- as.POSIXct(paste(power$new_date, power$Time), format="%Y-%m-%d %H:%M:%S")
plot(power$new_time, power$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.cur()
dev.copy(png, file = "plot2.png")
dev.off()
