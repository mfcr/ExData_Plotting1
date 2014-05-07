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

# Open "png" graphic device and name the output file as "plot2.png".
png(file="plot2.png")

# Setting parameter of backgroung as transparent.
par(bg="transparent")

# Plot the chart and draw line.
plot(data$Date_Time,data$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n")
lines(data$Date_Time,data$Global_active_power)

# Don't forget to turn off the graphic device.
dev.off()
