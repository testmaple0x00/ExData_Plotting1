total_data<-read.csv("household_power_consumption.txt",head=TRUE,sep=";")
all_date<-as.Date(total_data$Date, "%d/%m/%Y")
wanted_data<-total_data[all_date=="2007-02-01"|all_date=="2007-02-02",]

library(datasets)
par(mfcol=c(2,2),mar=c(4,4,2,1))

calc_time<-as.numeric(wanted_data$Time)/1440+(difftime(as.Date(wanted_data$Date, "%d/%m/%Y"),"2007-02-01")-8)/24
#part1
plot(calc_time,y=as.numeric(as.character(wanted_data$Global_active_power)),type="l",xaxt = "n",xlab="",ylab="Global active power (kilowatts)")
axis(1,c(0,1,2),c("Thu","Fri","Sat"))
#part2
sub1<-as.integer(as.character(wanted_data$Sub_metering_1))
sub2<-as.integer(as.character(wanted_data$Sub_metering_2))
sub3<-as.integer(as.character(wanted_data$Sub_metering_3))

plot(calc_time,y=sub1,type="l",xaxt = "n",xlab="",ylab="Energy sub metering")
axis(1,c(0,1,2),c("Thu","Fri","Sat"))
points(calc_time,y=sub2,type="l",col="red")
points(calc_time,y=sub3,type="l",col="blue")
legend("topright",bty = "n",
       legend=c("Sub_metering_1     ","Sub_metering_2     ","Sub_metering_3     "),
       col=c("black","red","blue"),
       lwd=c(1,1,1),cex=0.8, pt.cex = 1)

#part3
plot(calc_time,y=as.numeric(as.character(wanted_data$Voltage)),type="l",xaxt = "n",xlab="datetime",ylab="Voltage")
axis(1,c(0,1,2),c("Thu","Fri","Sat"))

#part4
plot(calc_time,y=as.numeric(as.character(wanted_data$Global_reactive_power)),type="l",xaxt = "n",xlab="datetime",ylab="Global_reactive_power")
axis(1,c(0,1,2),c("Thu","Fri","Sat"))

dev.copy(png,file="plot4.png")
dev.off()
