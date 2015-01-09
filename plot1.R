# Initiate saving as a png file

png(
  "plot1.png",
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

# Convert the Global_active_power column from a factor into numeric

newdata$Global_active_power<-as.numeric(newdata$Global_active_power)

# Draw Plot 1 i.e. a Histogram

hist(newdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# Finish saving as png file

dev.off()

