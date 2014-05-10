##Input and clean data from data source
Data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")
Data$Date<-as.Date(Data$Date,format='%d/%m/%Y')
Data<-Data[which(Data$Date=="2007-02-01"|Data$Date=="2007-02-02"),]
Data$DT<-paste(Data$Date,Data$Time,sep=" ")
Data$DT<-strptime(Data$DT,format="%Y-%m-%d %H:%M:%S")
Data$Global_active_power<-as.numeric(as.character(Data$Global_active_power))
Data$Global_reactive_power<-as.numeric(as.character(Data$Global_reactive_power))
Data$Sub_metering_1<-as.numeric(as.character(Data$Sub_metering_1))
Data$Sub_metering_2<-as.numeric(as.character(Data$Sub_metering_2))
Data$Sub_metering_3<-as.numeric(as.character(Data$Sub_metering_3))
Data$Voltage<-as.numeric(as.character(Voltage))

##Open plot device
png(filename="plot4.png",width=480,height=480,units="px")

##Set up 2*2 plot frame
par(mfcol=c(2,2))

##Plot the global active power line chart
plot(x=Data$DT,y=Data$Global_active_power,type="n",ylab="Global Active Power (Kilowatts)",xlab="")
lines(x=Data$DT,y=Data$Global_active_power,type="l")


##Plot sub merterings line chart
plot(x=Data$DT,y=Data$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(x=Data$DT,y=Data$Sub_metering_1,type="l",col="black")
lines(x=Data$DT,y=Data$Sub_metering_2,type="l",col="red")
lines(x=Data$DT,y=Data$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Plot Voltage
plot(x=Data$DT,y=Data$Voltage,type="n",ylab="Voltage",xlab="datetime")
lines(x=Data$DT,y=Data$Voltage,type="l",col="black")

##Plot 
plot(x=Data$DT,y=Data$Global_reactive_power,type="n",xlab="datetime")
lines(x=Data$DT,y=Data$Global_reactive_power,type="l")

##turn off the device
dev.off()