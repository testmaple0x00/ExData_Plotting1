total_data<-read.csv("household_power_consumption.txt",head=TRUE,sep=";")
all_date<-as.Date(total_data$Date, "%d/%m/%Y")
wanted_data<-total_data[all_date=="2007-02-01"|all_date=="2007-02-02",]

library(datasets)

calc_time<-as.numeric(wanted_data$Time)/1440+as.integer((difftime(as.Date(wanted_data$Date, "%d/%m/%Y"),"2007-02-01"))/24)

plot(calc_time,y=as.numeric(as.character(wanted_data$Global_active_power)),type="l",xaxt = "n",xlab="",ylab="Global active power (kilowatts)")
axis(1,c(0,1,2),c("Thu","Fri","Sat"))

dev.copy(png,file="plot2.png")
dev.off()

