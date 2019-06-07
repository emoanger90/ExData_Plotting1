### read into the data set
data<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings = "?",as.is=c("Date","Time"))
### subset the data with selected dates
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
### convert date and time into date and posixlt data
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(paste(data$Date,data$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")
### creating plot2 
png(filename = "plot2.png",height = 480,width = 480)
with(data,plot(Time,Global_active_power,ylab="Global Active Power (kilowatts)",xlab= "", type="l"))
dev.off()