#Plot 4: 2 by 2 plot

source("Plot1.R") # source Plot1.R code to load dataset & read, create subset and create date subset

#install lubridate # install.packages("lubridate")
#library(lubridate)

datetime <- with(subsetdata, ymd(Date) + hms(Time))

#datetime <- as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%Y-%m-%d %H:%M:%S")
newdata <- cbind(subsetdata, datetime)

png(file = "plot4.png", width=480, height=480)
# set up mfrow
par(mfrow = c(2,2))
# call 4 plots
with(newdata) 
  plot(newdata$datetime,newdata$Global_active_power, type="l", 
        ylab = "Global Active Power",xlab = "") 
  plot(newdata$datetime, newdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(newdata$datetime, newdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(newdata$datetime, newdata$Sub_metering_2, type="l", col= "red")
lines(newdata$datetime, newdata$Sub_metering_3, type="l", col= "blue")
legend("topright", lty= 1, lwd=1, col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(newdata$datetime, newdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
