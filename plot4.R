plot4graph <- function(){
        data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
        # Filter only 2 days ( 1,2 Feb 2007)
        data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
        
        data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
        data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
        data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
        data$Voltage <- as.numeric(data$Voltage)
        data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
        data$Global_active_power <- as.numeric(data$Global_active_power)
        
        date_And_time <- strptime(paste(data$Date, data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S") 
        
        # initialize the device
        png("plot4.png", width = 480, height = 480)
        
        # plot
        par(mfrow = c(2,2))
        
        # location 1 x 1
        plot(date_And_time, data$Global_active_power, xlab = "", ylab="Global Active Power", type = "l", col = "black")
        
        # location 1 x 2
        plot(date_And_time, data$Voltage, xlab = "datetime", ylab="Voltage", type = "l", col = "black")

        # location 2 x 1
        plot(date_And_time, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab="Energy sub metering")
        lines(date_And_time, data$Sub_metering_2,  type = "l", col = "red")
        lines(date_And_time, data$Sub_metering_3,  type = "l", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"), bty = "n")
        
        # location 2 x 2
        plot(date_And_time, data$Global_reactive_power, type = "l", col = "black", ylab = "Global_reactive_power", xlab = "datetime")
        
        #clode the device
        dev.off()
}
