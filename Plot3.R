Plot3<- function () {
  
unzip("./exdata_data_household_power_consumption.zip")
pdata<- read.table("household_power_consumption.txt", header= TRUE, sep= ";")
pdata$Date <- as.Date(pdata$Date, "%d/%m/%Y")
spdata<- pdata[pdata$Date== "2007-2-1" | pdata$Date== "2007-2-2" , ]

wdays<- c(unique(weekdays(spdata$Date)), weekdays(as.Date("2007-2-3")))   

#wdays<- paste(wdays,  )
png(filename="Plot3.png", width = 480, height = 480)

par(mar=c(3,4,2,2))
n<- NROW(spdata)
plot(as.numeric(paste(spdata[,7])), xaxt= "n", type= "l", ylab = "Energy sub metering")
points(as.numeric(paste(spdata[,8])), type= "l", col= "blue" )
points(as.numeric(paste(spdata[,9])), type= "l", col= "red" )

axis(1, c(1, n/2, n), labels= wdays)
legend('topright', c('Sub_metering_1','sub_metering_2', 'sub_metering_3'), lty= 1, col=c('black','blue','red')) 

dev.off()

}
