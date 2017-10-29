##Read in data and restrict sample to readings from 2/1/2007-2/2/2007
rawdata<-"./data/household_power_consumption.txt"
housedata<-read.table(rawdata, header = TRUE, sep = ";", stringsAsFactors = FALSE)
housedata<-housedata[housedata$Date %in% c("1/2/2007", "2/2/2007"),]

##Clean Date and create DateTime variable
housedata$Date<-as.Date(housedata$Date, format = "%d/%m/%Y")
DateTime<-paste(as.Date(housedata$Date),housedata$Time)
housedata$DateTime<-as.POSIXct(DateTime)

##Create plot3.png
png("plot.3.png", width=480, height=480)
with(housedata, {
  plot(Sub_metering_1~DateTime, type = "l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateTime, col="red")
  lines(Sub_metering_3~DateTime, col="blue")
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()