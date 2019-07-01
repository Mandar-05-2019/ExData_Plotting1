plot3graph <- function(){
        data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
        # Filter only 2 days ( 1,2 Feb 2007)
        data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
        
        data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
        data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
        data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
        
        date_And_time <- strptime(paste(data$Date, data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S") 
        
        # initialize the device
        png("plot3.png", width = 480, height = 480)
        
        # plot
        plot(date_And_time, data$Sub_metering_1, type = "l", col = "black", ylab="Energy sub metering",xlab = "")
        lines(date_And_time, data$Sub_metering_2,  type = "l", col = "red")
        lines(date_And_time, data$Sub_metering_3,  type = "l", col = "blue")
        
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"))
        
        #clode the device
        dev.off()
}
