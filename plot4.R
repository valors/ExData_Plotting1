power<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";",stringsAsFactors = FALSE)

library(lubridate)
power$Date<-dmy(power$Date)

power.days<-power[power$Date==ymd(20070201) | power$Date==ymd(20070202),]

rm(power)

png(filename="plot4.png")

points<-1:length(power.days$Time)

# With par and mfrow we specify that we want to create a 2x2 matrix of plots

par(mfrow=c(2,2))

# We start with copying the code we had for plot1

  with(power.days,plot(points,Global_active_power,type="l",ylab="Global Active Power",xaxt="n",xlab=""))
  axis(side=1,labels=c("Thu","Fri","Sat"),at=c(1,60*24+1,2880))

# Then plot 2. Just changing the y variable and label for Voltage and adding the xlabel datetime  
  
  with(power.days,plot(points,Voltage,type="l",ylab="Voltage",xaxt="n",xlab="datetime"))
  axis(side=1,labels=c("Thu","Fri","Sat"),at=c(1,60*24+1,2880))
  
# Then plot 3, copying our previous plot, with the only changing being to add bty="n" in the legend,
# which removes the box around the legend  
    
  with(power.days, {
    plot(points,Sub_metering_1,type="n",ylab="Energy sub metering",xaxt="n",xlab="")
    lines(points,Sub_metering_1)
    lines(points,Sub_metering_2,col="red")
    lines(points,Sub_metering_3,col="blue")
    legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
    axis(side=1,labels=c("Thu","Fri","Sat"),at=c(1,60*24+1,2880)) })
  
# And finally plot 4, same as the one for Voltage, but using Global_reactive_power
    
  with(power.days,plot(points,Global_reactive_power,type="l",ylab="Global_reactive_power",xaxt="n",xlab="datetime"))
  axis(side=1,labels=c("Thu","Fri","Sat"),at=c(1,60*24+1,2880))
  
  dev.off()
  