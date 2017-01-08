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

plot2 <- function() {
        plot(data2$timestamp,data2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
        cat("plot2.png has been saved in", getwd())
}
plot2()

