library(dplyr)

##Load data
RData<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

##Convert Date and time and other columns to correct format
RData$Date=as.Date(RData$Date,format = "%d/%m/%Y")
RData$Time=strptime(testdata$Time,format = "%H:%M:%S")

##Extracting dates
Pdata<-filter(testdata,Date>="2007-02-01"&Date<="2007-02-02")

##Conversion of relevant columns to numeric
Pdata$Global_active_power=as.numeric(Pdata$Global_active_power)

##Creating the graph
hist(Pdata$Global_active_power,main = "Global Active Power",col = "red",xlab = "Global Active Power (kilowatts")

##Copying file to png file
dev.copy(png,file="plot1.png")

##Closing file
dev.off()