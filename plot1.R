total_data<-read.csv("household_power_consumption.txt",head=TRUE,sep=";")
all_date<-as.Date(total_data$Date, "%d/%m/%Y")
wanted_data<-total_data[all_date=="2007-02-01"|all_date=="2007-02-02",]

library(datasets)
hist(as.numeric(as.character(wanted_data$Global_active_power)),col="red",main="Global active power",xlab="Global active power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()