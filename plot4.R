#CODE THAT IS REPEATED ACROSS AL FILES OF ASSIGMENT
# GET data.
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#format dates
data[,1]<-as.Date(data[,1],"%d/%m/%Y")

# Select data where dates are only 2007-02-01 and 2007-02-02,
data<-consumption[consumption$Date %in% c("1/2/2007","2/2/2007"),]

# Join date and time and bind it to the existing data.
data<-cbind(strptime(paste(data[,1],data[,2]), "%Y-%m-%d %H:%M:%S"),data[,c(3:9)]) 
#END OF REPEATED CODE


# Call "png" graphic device and save the plot as "plot4.png".
png(file="plot4.png")

# set backgroung to transparent and create a 2x2 chart array
par(bg="transparent",mfcol=c(2,2))

# Plot the "Global active power".
plot(data$Date_Time,data$Global_active_power,xlab="",ylab="Global Active Power",type="n")
lines(data$Date_Time,data$Global_active_power)

# Plot the "Energy sub metering".
plot(data$Date_Time,data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(data$Date_Time,data$Sub_metering_1,col="black")
lines(data$Date_Time,data$Sub_metering_2,col="red")
lines(data$Date_Time,data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),bty="n",lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot the "Voltage".
plot(data$Date_Time,data$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(data$Date_Time,data$Voltage)

# Plot the "Global reactive power".
plot(data$Date_Time,data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(data$Date_Time,data$Global_reactive_power)

# Don't forget to turn off the graphic device.
dev.off()
