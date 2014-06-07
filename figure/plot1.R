#loading data 
d<-read.table("../household_power_consumption.txt", header=T, na.strings="?", sep=";" )
d$Time<- paste(d$Date, d$Time, sep=" ")
d$Date<-as.Date(strptime(d$Date, format="%d/%m/%Y"))
d$Time<-strptime(d$Time, format="%d/%m/%Y %H:%M:%S")

d.sub<-d[which(d$Date=="2007-02-01" | d$Date=="2007-02-02"),]


#Plot n°1
png("plot1.png", width=480, height=480)
hist(d.sub$Global_active_power, main="Globale active power", xlab="Globale Active Power (kilowatts)", col="red")
dev.off()
