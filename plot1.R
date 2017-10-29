##Read in data and restrict sample to readings from 2/1/2007-2/2/2007
rawdata<-"./data/household_power_consumption.txt"
housedata<-read.table(rawdata, header = TRUE, sep = ";", stringsAsFactors = FALSE)
housedata<-housedata[housedata$Date %in% c("1/2/2007", "2/2/2007"),]

##Create plot1.png
png("plot1.png", width = 480, height = 480)
hist(as.numeric(housedata$Global_active_power), col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()