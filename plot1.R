### read into the data set
data<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings = "?",as.is=c("Date","Time"))
### subset the data with selected dates
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
### convert date and time into date and posixlt data
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(paste(data$Date,data$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")
### creating plot 1
png(filename="plot1.png",width=480,height=480)
with(data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()
