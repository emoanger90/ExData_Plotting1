### read into the data set
data<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings = "?",as.is=c("Date","Time"))
### subset the data with selected dates
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
### convert date and time into date and posixlt data
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(paste(data$Date,data$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")
### creating plot3
png(filename = "plot3.png",height = 480,width = 480)
with(data,plot(Time,Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering"))
with(data,lines(Time,Sub_metering_2,col="red"))
with(data,lines(Time,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)
dev.off()