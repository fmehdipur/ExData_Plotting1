Plot2<- function () {
  
unzip("./exdata_data_household_power_consumption.zip")
pdata<- read.table("household_power_consumption.txt", header= TRUE, sep= ";")
pdata$Date <- as.Date(pdata$Date, "%d/%m/%Y")
spdata<- pdata[pdata$Date== "2007-2-1" | pdata$Date== "2007-2-2" , ]

wdays<- c(unique(weekdays(spdata$Date)), weekdays(as.Date("2007-2-3")))   

#wdays<- paste(wdays,  )
png(filename="Plot2.png", width = 480, height = 480)
par(mar=c(3,4,2,2))
n<- NROW(spdata)
plot(as.numeric(paste(spdata[,3])), xaxt= "n", type= "l", ylab = "Global Ative Power (kilowatts)")
axis(1, c(1, n/2, n), labels= wdays)
#text(x = spdata$Date, par("usr")[3]*.97, labels = weekdays(spdata$Date), srt = 45, pos = 1, xpd = TRUE,cex=.7)
#plot(as.numeric(paste(spdata[,3])), col= "red", main= "Global Active Power", xlab= "Global Active Power (kilowatts)")

dev.off()

}
