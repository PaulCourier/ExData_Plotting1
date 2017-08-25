data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("Date"="character"),stringsAsFactors=FALSE)
data<-subset(data,Date == "1/2/2007" | Date == "2/2/2007")
data<-transform(data,Global_active_power=as.numeric(Global_active_power),Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_2=as.numeric(Sub_metering_2),Sub_metering_3=as.numeric(Sub_metering_3),Voltage <- as.numeric(Voltage),Global_reactive_power<- as.numeric(Global_reactive_power))
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, data$sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, data$sub_metering_2, type="l", col="red")
lines(datetime, data$sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()