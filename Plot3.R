setwd("~/Documents/DataAnalyst/CouseraCourse/ExploratorydataAnalysis/Week1")
rm(list=ls())
source("rotines.R")
dfHouseholdPowerConsumption = getData()
dirImg="./img"
if  (!file.exists(dirImg)) {
  dir.create(dirImg)
}
png(filename = paste(dirImg,"plot3.png",sep="/"), width = 480, height=480)
plot(dfHouseholdPowerConsumption$DateTime,dfHouseholdPowerConsumption$Sub_metering_1,type="l",main=NULL,xlab="",ylab="")
points(dfHouseholdPowerConsumption$DateTime,dfHouseholdPowerConsumption$Sub_metering_2, type="l", col="red")
points(dfHouseholdPowerConsumption$DateTime,dfHouseholdPowerConsumption$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1),cex=.75,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
title(ylab="Energy sub metering",font.lab=1,cex.lab=.75)
dev.off()