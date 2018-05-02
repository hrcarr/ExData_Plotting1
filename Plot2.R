#Plot 2 need to generate a hist of time vs. global active power
source("Plot1.R") # source Plot1.R code to load & read dataset, create subset and create date subset
#create date and time variable (add col.) in subset. dataframe 
#install lubridate # install.packages("lubridate")
#library(lubridate)
#library(dplyr)
datetime <- with(subsetdata, ymd(Date) + hms(Time))
 
#datetime <- as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%Y-%m-%d %H:%M:%S")
newdata <- cbind(subsetdata, datetime)

## plot datetime vs globalactivepower

png(file = "plot2.png", width=480, height=480)
with(newdata, plot(newdata$datetime, newdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()