plot3 <- function() {
        # to make sure the weekday names are English
        Sys.setlocale(category = "LC_ALL", locale = "C")
        source("R4P1.R")
        mydata<-getdata()
        png(file = "plot3.png", width = 480, height = 480, units = "px")
        plot(mydata$realdate, mydata$Sub_metering_1, 
             type = "l", 
             col="black", 
             xlab = "", 
             ylab = "Energy sub metering", 
             xaxt = "n")
        lines(mydata$realdate, mydata$Sub_metering_2, col = "red")
        lines(mydata$realdate, mydata$Sub_metering_3, col = "blue")
        # is there a smarter way to put the names of vars there?
        legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty=c(1,1,1), 
               col=c("black", "red","blue"))
        
        # no idea how to get there the Saturday tick other that like this
        dates<-c(as.Date(mydata$realdate), max(as.Date(mydata$realdate))+1)
        # add axis x
        axis.POSIXct(1, at=dates, labels=format(dates, "%a"))
        dev.off()
}