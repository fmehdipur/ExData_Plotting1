Plot1<- function () {
  
unzip("./exdata_data_household_power_consumption.zip")
pdata<- read.table("household_power_consumption.txt", header= TRUE, sep= ";")
pdata$Date <- as.Date(pdata$Date, "%d/%m/%Y")
spdata<- pdata[pdata$Date== "2007-2-1" | pdata$Date== "2007-2-2" , ]

png(filename="Plot1.png", width = 480, height = 480)
hist(as.numeric(paste(spdata[,3])), col= "red", main= "Global Active Power", xlab= "Global Active Power (kilowatts)")
dev.off()

}
