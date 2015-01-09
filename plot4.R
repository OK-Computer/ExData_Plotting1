# Initiate saving as a png file

png(
  "plot4.png",
  width=480,
  height=480,
  units="px"
)

# Read data from the source file

data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Convert the Date column from a factor into a date

data$Date<-as.Date(data$Date,"%d/%m/%Y")

# Subset for just 1 Feb 2007 and 2 Feb 2007

newdata<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")

# Convert the Time column from a factor into a time

newdata$Time<-strftime(newdata$Time,format="%H:%M:%S")

# Create a new column, called "datetime", which combines the information in Date and Time

newdata$datetime<-as.POSIXlt(paste(newdata$Date, newdata$Time), format="%Y-%m-%d %H:%M:%S", usetz=TRUE)

#***PLOT 4***
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(newdata, {
  plot(datetime,Global_active_power, type="n", xlab="",ylab="Global Active Power (kilowatts)")
  lines(datetime,Global_active_power, type="l")
  
  plot(datetime,Voltage,type="n",xlab="datetime",ylab="Voltage")
  lines(datetime,Voltage,type="l")
  
  plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  lines(datetime,Sub_metering_1,type="l")
  lines(datetime,Sub_metering_2,type="l",col="red")
  lines(datetime,Sub_metering_3,type="l",col="blue")
  legend("topright",pch=NA,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8,lty=1,bty="n")
  
  plot(datetime, Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
  lines(datetime,Global_reactive_power,type="l")
  
})


# Finish saving as png file

dev.off()

