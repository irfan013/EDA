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

plot3 <- function() {
        plot(data2$timestamp,data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(data2$timestamp,data2$Sub_metering_2,col="red")
        lines(data2$timestamp,data2$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
        dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()
        cat("plot3.png has been saved in", getwd())
}
plot3()