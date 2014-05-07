#CODE THAT IS REPEATED ACROSS AL FILES OF ASSIGMENT
# GET data.
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#format dates
data[,1]<-as.Date(data[,1],"%d/%m/%Y")

# Select data where dates are only 2007-02-01 and 2007-02-02,
data<-rbind(data[as.Date(data[,1])=="2007-02-01",],data[as.Date(data[,1])=="2007-02-02",])

# Join date and time and bind it to the existing data.
data<-cbind(strptime(paste(data[,1],data[,2]), "%Y-%m-%d %H:%M:%S"),data[,c(3:9)]) 
#END OF REPEATED CODE

# Open "png" graphic device and name the output file as "plot3.png".
png(file="plot3.png")

# Setting parameter of backgroung as transparent.
par(bg="transparent")

# Set up the chart, plot three variables as lines on the chart, plot legend onto the chart.
plot(dt$Date_Time,dt$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(dt$Date_Time,dt$Sub_metering_1,col="black")
lines(dt$Date_Time,dt$Sub_metering_2,col="red")
lines(dt$Date_Time,dt$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Don't forget to turn off the graphic device.
dev.off()
