##Load data
RData<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

##Convert Date and time to correct format
RData$Date=as.Date(RData$Date,format = "%d/%m/%Y")