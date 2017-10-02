getData <- function() {
  message("Getting data")
  library(dplyr)
  dirDest="./data"
  if  (!file.exists(dirDest)) {
    dir.create(dirDest)
  }
  fileUrl = "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
  zipFileName="household_power_consumption.zip"
  txtFileName="household_power_consumption.txt"
  zipFilePath=paste(dirDest,zipFileName,sep="/")
  txtFilePath=paste(dirDest,txtFileName,sep="/")
  if (!file.exists(txtFilePath)) {
      if (!file.exists(zipFilePath)) {
        message("dowloading head")
        download.file(fileUrl,zipFilePath,method = "curl")
      }
    message("unziping")
    unzip(zipFilePath,exdir=dirDest)
  }
  message(paste("reading",txtFilePath,"to Dataframe" ))
  df = read.table(txtFilePath,
                  sep=";",header=TRUE,,na.strings="?", 
                  colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  df=subset(df,Date=="1/2/2007" | Date=="2/2/2007")
  df=mutate(df,DateTime=as.POSIXct(paste(Date, Time),format='%d/%m/%Y %H:%M:%S'))
  df
}
