f1<-"exdata-data-household_power_consumption.zip"
f2<-unzip(f1)
data1 <- read.table(f2, header=T, sep=";")
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data2 <- data1[(data1$Date=="2007-02-01") | (data1$Date=="2007-02-02"),]
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data2$Global_reactive_power <- as.numeric(as.character(data2$Global_reactive_power))
data2$Voltage <- as.numeric(as.character(data2$Voltage))
data2 <- transform(data2, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

plot4 <- function() {
        par(mfrow=c(2,2))
        
        	#PLOT 1
        plot(data2$timestamp,data2$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        
	  	#PLOT 2
        plot(data2$timestamp,data2$Voltage, type="l", xlab="datetime", ylab="Voltage")
        
       	#PLOT 3
        plot(data2$timestamp,data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(data2$timestamp,data2$Sub_metering_2,col="red")
        lines(data2$timestamp,data2$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
        
        	#PLOT 4
        plot(data2$timestamp,data2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        
       	#OUTPUT
        dev.copy(png, file="plot4.png", width=480, height=480)
        dev.off()
        cat("plot4.png has been saved in", getwd())
}
plot4()


