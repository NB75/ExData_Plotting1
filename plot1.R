plot1 <- function() {

library(dplyr)  
  
#Extraction
filename <- 'household_power_consumption.csv'
init_df <- read.csv(filename, colClasses = "character")

date_interval <- c("1/2/2007","2/2/2007")

filter_df <- subset(init_df,init_df$Date %in% date_interval)

filter_df <- mutate(filter_df,Date = as.Date(Date,format = "%d/%m/%Y"))
filter_df <- mutate(filter_df,DateTime = paste(Date,Time,sep=" "))

old_head <- as.vector(names(filter_df))
col_to_import <- c(10,3:9)
col_num <- length(col_to_import)

for (i in 1:col_num) {
  j <- col_to_import[i]
  if (i==1) {
    plot_df <- data.frame(filter_df[,j])
    new_names <- as.vector(old_head[j])
    } else  {
  plot_df <- data.frame(plot_df,filter_df[,j])
  new_names <- c(new_names,old_head[j])  
  }
}

plot_df <- setNames(plot_df,new_names)

x <- as.numeric(plot_df$Global_active_power)

png(file="plot1.png",width=480,height=480)
hist(x,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()

}