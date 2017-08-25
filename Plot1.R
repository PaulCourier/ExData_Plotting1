data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("Date"="character"),stringsAsFactors=FALSE)
data<-subset(data,Date == "1/2/2007" | Date == "2/2/2007")
data<-transform(data,Global_active_power=as.numeric(Global_active_power))
is.numeric(data$Global_active_power)
hist(data$Global_active_power, main = "Global Active power", col="red",xlab="Global Active Pover(kw)")

dev.copy(png,'plot1.png',bg="red")
dev.off()