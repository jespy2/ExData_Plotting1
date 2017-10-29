##Read in data and restrict sample to readings from 2/1/2007-2/2/2007
rawdata<-"./data/household_power_consumption.txt"
housedata<-read.table(rawdata, header = TRUE, sep = ";", stringsAsFactors = FALSE)
housedata<-housedata[housedata$Date %in% c("1/2/2007", "2/2/2007"),]

##Clean Date and create DateTime variable
housedata$Date<-as.Date(housedata$Date, format = "%d/%m/%Y")
DateTime<-paste(as.Date(housedata$Date),housedata$Time)
housedata$DateTime<-as.POSIXct(DateTime)

##Create plot2.png
png("plot2.png", width = 480, height = 480)
with(housedata, {
  plot(Global_active_power~DateTime, type = "l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()
