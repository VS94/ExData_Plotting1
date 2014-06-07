#loading data 
d<-read.table("../household_power_consumption.txt", header=T, na.strings="?", sep=";" )
d$Time<- paste(d$Date, d$Time, sep=" ")
d$Date<-as.Date(strptime(d$Date, format="%d/%m/%Y"))
d$Time<-strptime(d$Time, format="%d/%m/%Y %H:%M:%S")

d.sub<-d[which(d$Date=="2007-02-01" | d$Date=="2007-02-02"),]

#Plot n°2
png("plot2.png", width=480, height=480)
plot(d.sub$Time,d.sub$Global_active_power, type='l', main="", xlab="", ylab="Globale Active Power (kilowatts)")
dev.off()

