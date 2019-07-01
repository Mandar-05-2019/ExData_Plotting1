plot1graph <- function(){
        data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
        # Filter only 2 days ( 1,2 Feb 2007)
        data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
        
        global_Active_Power <- as.numeric(data$Global_active_power)
        
        # initialize the device
        png("plot1.png", width = 480, height = 480)
        
        # plot the histogram
        hist(global_Active_Power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        
        #clode the device
        dev.off()
}
