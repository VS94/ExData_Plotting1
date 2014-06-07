#loading data 
d<-read.table("../household_power_consumption.txt", header=T, na.strings="?", sep=";" )
d$Time<- paste(d$Date, d$Time, sep=" ")
d$Date<-as.Date(strptime(d$Date, format="%d/%m/%Y"))
d$Time<-strptime(d$Time, format="%d/%m/%Y %H:%M:%S")

d.sub<-d[which(d$Date=="2007-02-01" | d$Date=="2007-02-02"),]

#Plot n°3
png("plot3.png", width=480, height=480)
plot(d.sub$Time,d.sub$Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering")
lines(d.sub$Time,d.sub$Sub_metering_2, col="red")
lines(d.sub$Time,d.sub$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black", "blue", "red"))
dev.off()
