plot1 <- function() {
        source("R4P1.R")
        mydata<-getdata()
        png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
        hist(mydata$Global_active_power, 
             col = 'red', 
             main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
        dev.off()
}