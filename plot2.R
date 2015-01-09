# Initiate saving as a png file

png(
  "plot2.png",
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

#***PLOT 2***

# Create a new column, called "datetime", which combines the information in Date and Time

newdata$datetime<-as.POSIXlt(paste(newdata$Date, newdata$Time), format="%Y-%m-%d %H:%M:%S", usetz=TRUE)

# Draw Plot 2 i.e. a line

plot(newdata$datetime,newdata$Global_active_power, type="n", xlab="",ylab="Global Active Power (kilowatts)")
lines(newdata$datetime,newdata$Global_active_power, type="l")

#plot(newdata$Time,newdata$Global_active_power, type="n", xlab="",ylab="Global Active Power (kilowatts)")
#lines(newdata$Time,newdata$Global_active_power, type="l")

# Finish saving as png file

dev.off()




