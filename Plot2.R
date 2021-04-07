library(dplyr)
library(lubridate)

##Load data
RData<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

##Convert Date to correct format
RData$Date=as.Date(RData$Date,format = "%d/%m/%Y")


##Extracting dates
Pdata<-filter(testdata,Date>="2007-02-01"&Date<="2007-02-02")

##Merging Date and Time columns
Pdata$date_time=ymd_hms(paste(Pdata$Date,Pdata$Time))

##Conversion of relevant columns to numeric
Pdata$Global_active_power=as.numeric(Pdata$Global_active_power)

##Creating graph
plot(Pdata$Global_active_power~Pdata$date_time,type = "l",xlab="",ylab="Global Active Power( kilowatts)")

##Copying to PNG device and closing graph
dev.copy(png,file="plot2.png")
dev.off()