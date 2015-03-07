download <- function() { 
        if (!file.exists("R4P1/dataset.zip")) {
                dir.create("./R4P1", showWarnings = FALSE)
                fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                download.file(fileUrl, destfile = "R4P1/dataset.zip",  mode="wb")
                
                unzip("R4P1/dataset.zip", exdir ="R4P1")
        }
}



getdata <-function() {
        varnames<-as.character(unlist(read.delim("R4P1/household_power_consumption.txt", header = FALSE, sep=";", nrows = 1)[1,]))
        testdata<-read.table("R4P1/household_power_consumption.txt", header=TRUE, col.names = varnames, colClasses = c('character', 'character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'), sep = ";", na.strings = c("?"))
        subset<-testdata[grep("^[12]/2/2007", testdata$Date), ]
        returndata<-cbind(subset, strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M:%S", tz="UTC"))
        colnames(returndata)[10] <- "realdate"
        return(returndata)
}

