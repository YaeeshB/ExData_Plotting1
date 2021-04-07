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
Pdata$Sub_metering_1=as.numeric(Pdata$Sub_metering_1)
Pdata$Sub_metering_2=as.numeric(Pdata$Sub_metering_2)
Pdata$Sub_metering_3=as.numeric(Pdata$Sub_metering_3)

##Plotting the graph
plot(Pdata$Sub_metering_1~Pdata$date_time,type = "l",xlab="",ylab="Energy sub meeting")
lines(x=Pdata$date_time,y=Pdata$Sub_metering_2,col="red")
lines(x=Pdata$date_time,y=Pdata$Sub_metering_3,col="blue")

##Creating the legend
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = 2)

##Copying to PNG device and closing graph
dev.copy(png,"plot3.png")
dev.off