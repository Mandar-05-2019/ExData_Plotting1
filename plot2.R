plot2graph <- function(){
        data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
        # Filter only 2 days ( 1,2 Feb 2007)
        data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
        
        global_Active_Power <- as.numeric(data$Global_active_power)
        date_And_time <- strptime(paste(data$Date, data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S") 
        
        # initialize the device
        png("plot2.png", width = 480, height = 480)
        
        # plot the histogram
        plot(date_And_time, global_Active_Power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
        
        #clode the device
        dev.off()
}
