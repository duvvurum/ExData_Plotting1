rm(list=ls())
#Setworking directory
setwd("~/GitHub/ExData_Plotting1")
#read input data for 01/01/2007 and 02/01/2007
data <- read.table(file = "household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", na.strings = "?")
names(data) <- strsplit(readLines("household_power_consumption.txt", n=1),";")[[1]]                
#convert values in date column to "date" format
data<-data.frame(Date_Time=0,data)
data$Date_Time<-paste(data$Date,data$Time,sep=" ")
data$Date<-as.Date(data$Date,tz="EST", format="%d/%m/%Y")
data$Date_Time<-strptime(data$Date_Time,format="%d/%m/%Y %H:%M:%S",tz="EST")
# plot 1
hist(data$Global_active_power, main = "Global Active Power", col = "Red", xlab = "Global Active Power(kilowatts)")
dev.copy(png, "plot1.png", units = "px", height=480, width=480)
dev.off()
