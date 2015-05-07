plot2 <- function() {

library(dplyr)  
  
#Extraction
filename <- 'household_power_consumption.csv'
init_df <- read.csv(filename, colClasses = "character")

date_interval <- c("1/2/2007","2/2/2007")

filter_df <- subset(init_df,init_df$Date %in% date_interval)
filter_df <- mutate(filter_df,Date = as.Date(Date,format = "%d/%m/%Y"))

lines <- nrow(filter_df)
mid <- lines/2

png(file="plot2.png",width=480,height=480)
plot(1,type="n",xlab="",ylab="Global Active Power (kilowatts)",ylim=c(0,8),xlim=c(0,lines),xaxt="n")
axis(1,at=c(0,mid,lines),labels = c("Thu","Fri","Sat"))
lines(filter_df$Global_active_power)
dev.off()

}