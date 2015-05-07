plot3 <- function() {

library(dplyr)  
  
#Extraction and data preparation
filename <- 'household_power_consumption.csv'
init_df <- read.csv(filename, colClasses = "character")

date_interval <- c("1/2/2007","2/2/2007")

filter_df <- subset(init_df,init_df$Date %in% date_interval)
filter_df <- mutate(filter_df,Date = as.Date(Date,format = "%d/%m/%Y"))

lines <- nrow(filter_df)
mid <- lines/2

#chart creation

png(file="plot3.png",width=480,height=480)

plot(1,type="n",xlab="",ylab="Energy sub metering",ylim=c(0,40),xlim=c(0,lines),xaxt="n")
axis(1,at=c(0,mid,lines),labels = c("Thu","Fri","Sat"))
lines(filter_df$Sub_metering_1)
lines(filter_df$Sub_metering_2,col="red")
lines(filter_df$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1,
       cex = 0.5)
dev.off()

}