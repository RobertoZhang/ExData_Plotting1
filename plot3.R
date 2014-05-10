##Input and clean data from data source
Data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")
Data$Date<-as.Date(Data$Date,format='%d/%m/%Y')
Data<-Data[which(Data$Date=="2007-02-01"|Data$Date=="2007-02-02"),]
Data$DT<-paste(Data$Date,Data$Time,sep=" ")
Data$DT<-strptime(Data$DT,format="%Y-%m-%d %H:%M:%S")
Data$Global_active_power<-as.numeric(as.character(Data$Global_active_power))
Data$Sub_metering_1<-as.numeric(as.character(Data$Sub_metering_1))
Data$Sub_metering_2<-as.numeric(as.character(Data$Sub_metering_2))
Data$Sub_metering_3<-as.numeric(as.character(Data$Sub_metering_3))


##Plot line chart
png(filename="plot3.png",width=480,height=480,units="px")
plot(x=Data$DT,y=Data$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(x=Data$DT,y=Data$Sub_metering_1,type="l",col="black")
lines(x=Data$DT,y=Data$Sub_metering_2,type="l",col="red")
lines(x=Data$DT,y=Data$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##turn off the device
dev.off()