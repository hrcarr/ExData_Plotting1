#Plot 3 need to generate a hist of time vs. global active power
source("Plot1.R") # source Plot1.R code to load dataset, create subset and create date subset
#create date and time variable (add col.) in subset. dataframe 
#install lubridate # install.packages("lubridate")
#library(lubridate)
#library(dplyr)
datetime <- with(subsetdata, ymd(Date) + hms(Time))

#datetime <- as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%Y-%m-%d %H:%M:%S")
newdata <- cbind(subsetdata, datetime)
png(file = "plot2.png", width=480, height=480)

with(newdata, plot(newdata$datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(newdata$datetime, newdata$Sub_metering_2, type="l", col= "red")
lines(newdata$datetime, newdata$Sub_metering_3, type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty= 1, lwd=2, col = c("black", "red", "blue"))

dev.off()