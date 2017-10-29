##Read in data and restrict sample to readings from 2/1/2007-2/2/2007
rawdata<-"./data/household_power_consumption.txt"
housedata<-read.table(rawdata, header = TRUE, sep = ";", stringsAsFactors = FALSE)
housedata<-housedata[housedata$Date %in% c("1/2/2007", "2/2/2007"),]

##Clean Date and create DateTime variable
housedata$Date<-as.Date(housedata$Date, format = "%d/%m/%Y")
DateTime<-paste(as.Date(housedata$Date),housedata$Time)
housedata$DateTime<-as.POSIXct(DateTime)

##Create plot4.png
png("plot.4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

##Topleft plot
with(housedata, {
  plot(Global_active_power~DateTime, type = "l",
       ylab="Global Active Power", xlab="")
})
##Topright plot
with(housedata, {
  plot(Voltage~DateTime, type = "l",
       ylab="Voltage", xlab="datetime")
})
##Bottomleft plot
with(housedata, {
  plot(Sub_metering_1~DateTime, type = "l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateTime, col="red")
  lines(Sub_metering_3~DateTime, col="blue")
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##Bottomright plot
with(housedata, {
  plot(Global_reactive_power~DateTime, type = "l",
       ylab="Global_reactive_power", xlab="datetime")
})

dev.off()