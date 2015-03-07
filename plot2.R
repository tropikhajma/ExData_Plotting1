plot2 <- function() {
        # to make sure the weekday names are English
        Sys.setlocale(category = "LC_ALL", locale = "C")
        source("R4P1.R")
        mydata<-getdata()
        png(file = "plot2.png", width = 480, height = 480, units = "px")
        plot(mydata$realdate, mydata$Global_active_power, 
             type = "l", 
             xlab = "", ylab = "Global Active Power (kilowatts)", 
             xaxt = "n")
        # no idea how to get there the Saturday tick other that like this
        dates<-c(as.Date(mydata$realdate), max(as.Date(mydata$realdate))+1)
        # add axis x
        axis.POSIXct(1, at=dates, labels=format(dates, "%a"))
        dev.off()
}