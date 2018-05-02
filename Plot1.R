# Assignment 1: 
# Examine how household energy usage varies over 2-day period in Feb. 2007 (02-01 & 02-02) using data
# from UC Irvine's Machine Learning Rep. to reconstruct plots
# Plot1.R code: Global Active Power
# ls() (check)
# rm(list=ls()) (eliminate if necessary)

# get and set working directory: ("/Users/hilarycarr/Desktop/R_directory/Exploratory_Data_Analysis/")
# getwd() check
#if(!file.exists("Exploratory_Data_Analysis")) 
#  dir.create("Exploratory_Data_Analysis")
#setwd("/Users/hilarycarr/Desktop/R_directory/Exploratory_Data_Analysis/")

# load household_power_consumption.txt file () - txt file save in wd
# set na to ?
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# review data & convert date formate
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
#hpc$Time <- format(hpc$Time, format="%H:%M:%S")
#hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
#hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power)
#hpc$Voltage <- as.numeric(hpc$Voltage)
#hpca$Global_intensity <- as.numeric(hpc$Global_intensity)
#hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
#hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
#hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)
# subset for data taken from 2 days: 2007-02-01 and 2007-02-02 (remove)
subsetdata <- subset(hpc, Date == "2007-02-01" | Date =="2007-02-02")
#create png hist using Global Active Power for dates in question
png(file = "plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     xlim=range(0:6, 2), ylim=range(0:1200, 200))
dev.off()




