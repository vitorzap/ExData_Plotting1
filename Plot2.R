setwd("~/Documents/DataAnalyst/CouseraCourse/ExploratorydataAnalysis/Week1")
rm(list=ls())
source("rotines.R")
dfHouseholdPowerConsumption = getData()
dirImg="./img"
if  (!file.exists(dirImg)) {
  dir.create(dirImg)
}
png(filename = paste(dirImg,"plot2.png",sep="/"), width = 480, height=480)
plot(dfHouseholdPowerConsumption$DateTime,dfHouseholdPowerConsumption$Global_active_power,type="l",main=NULL,xlab="",ylab="")
title(ylab="Global Active Power (kilowatts)",font.lab=1,cex.lab=.75)
dev.off()