power<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";",stringsAsFactors = FALSE)

library(lubridate)
power$Date<-dmy(power$Date)

power.days<-power[power$Date==ymd(20070201) | power$Date==ymd(20070202),]

rm(power)

png(filename="plot3.png")

points<-1:length(power.days$Time)

# Here we plot different lines in the same plot. To do this we use again the useful variable "points",
# since all lines show the relationship with Time. We use lines() to plot the additional meterings 2 and 3.
# Also the legend() is added.
# The format of with(power.days,{...}) is used, to avoid typing again and again the source of data.

with(power.days, {
  plot(points,Sub_metering_1,type="n",ylab="Energy sub metering",xaxt="n",xlab="")
  lines(points,Sub_metering_1)
  lines(points,Sub_metering_2,col="red")
  lines(points,Sub_metering_3,col="blue")
  legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  axis(side=1,labels=c("Thu","Fri","Sat"),at=c(1,60*24+1,2880)) })

dev.off()