power<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";",stringsAsFactors = FALSE)

library(lubridate)
power$Date<-dmy(power$Date)

power.days<-power[power$Date==ymd(20070201) | power$Date==ymd(20070202),]

rm(power)

png(filename="plot2.png")

# Here, we create the variable "points", representing each point one minute.

points<-1:length(power.days$Time)

# Using the variable points, we plot the relationship of Time versus Global_active_power.
# First, we plot it without x axis using xaxt="n"

with(power.days,plot(points,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xaxt="n",xlab=""))

# Then we add an axis, with labels on: the minute 1 of Day 1, the minute 60*24+1 representing the start of Day 2,
# and the minute 2880 representing the end of Day 2.

axis(side=1,labels=c("Thu","Fri","Sat"),at=c(1,60*24+1,2880))

dev.off()