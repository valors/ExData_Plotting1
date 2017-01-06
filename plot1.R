# First we read the file into R. Important to note, that the values are separated by ";" and that NA values are coded as "?". 

power<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";",stringsAsFactors = FALSE)

# We convert the dates with lubridate, so that we can subset them easily, and save the subset in a new data frame.

library(lubridate)
power$Date<-dmy(power$Date)

power.days<-power[power$Date==ymd(20070201) | power$Date==ymd(20070202),]

rm(power)

# We open the PNG graphics device

png(filename="plot1.png")

# Code to create the histogram as in the example
 
hist(power.days$Global_active_power,
     main="Global Active Power",
     breaks=12,
     col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

# And finally, close the graphics device

dev.off()