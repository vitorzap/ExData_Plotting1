setwd("~/Documents/DataAnalyst/CouseraCourse/ExploratorydataAnalysis/Week1")
rm(list=ls())
source("rotines.R")
dfHouseholdPowerConsumption = getData()
dirImg="./img"
if  (!file.exists(dirImg)) {
  dir.create(dirImg)
}
png(filename = paste(dirImg,"plot1.png",sep="/"), width = 480, height=480)
hist(dfHouseholdPowerConsumption$Global_active_power,col="red",main=NULL,xlab=NULL,ylab=NULL)
title(expression(bold("Global Active Power")),font.main=1,cex.main=.75,
       xlab="Global Active Power (kilowatts)",font.lab=1,cex.lab=.75,
       ylab="Frequency",font.lab=1,cex.lab=.75)
dev.off()