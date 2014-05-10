##Input and clean data from data source
Data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")
Data$Date<-as.Date(Data$Date,format='%d/%m/%Y')
Data<-Data[which(Data$Date=="2007-02-01"|Data$Date=="2007-02-02"),]
Data$DT<-paste(Data$Date,Data$Time,sep=" ")
Data$DT<-strptime(Data$DT,format="%Y-%m-%d %H:%M:%S")
Data$Global_active_power<-as.numeric(as.character(Data$Global_active_power))

##Plot line chart
png(filename="plot2.png",width=480,height=480,units="px")
plot(x=Data$DT,y=Data$Global_active_power,type="n",ylab="Global Active Power (Kilowatts)",xlab="")
lines(x=Data$DT,y=Data$Global_active_power,type="l")

##Print out the png file
dev.off()