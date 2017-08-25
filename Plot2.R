data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("Date"="character"),stringsAsFactors=FALSE)
data<-subset(data,Date == "1/2/2007" | Date == "2/2/2007")
data<-transform(data,Global_active_power=as.numeric(Global_active_power))
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
with(data,plot(datetime,type="l",Global_active_power,ylab="Global Active Power (kilowatts)"))

dev.copy(png,'plot2.png',bg="red")
dev.off()