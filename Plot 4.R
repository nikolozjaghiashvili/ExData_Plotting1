## Plot 4
data = read.table("data.txt",sep = ";", header= TRUE)
data1 = data[as.Date(data$Date,"%d/%m/%Y") >= as.Date("01/02/2007","%d/%m/%Y"),]
data2 = data1[as.Date(data1$Date,"%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"),]
data = data2 
datetime = paste(data$Date, data$Time)
data = cbind(datetime, data)
par(mfcol = c(2,2))
data$datetime = strptime(data$datetime, "%d/%m/%Y %H:%M:%S")
data$Time = as.numeric(data$datetime)
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
plot(Global_active_power ~ Time, data, xaxt="none",ylab = "Global Active Power (kilowatts)", xlab = " ", main = NULL, type = "l")
axis(1, at=c(min(data$Time),mean(data$Time),max(data$Time)),labels=c("Thu","Fri","Sat"))

data$Sub_metering_1 = as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 = as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 = as.numeric(as.character(data$Sub_metering_3))
plot(Sub_metering_1 ~ Time, data, xaxt="none",ylab = "Energy Sub metering", xlab = " ", main = NULL, type = "l", col = "black")
lines(Sub_metering_2 ~ Time,data, col = "red")
lines(Sub_metering_3 ~ Time,data, col = "blue")
axis(1, at=c(min(data$Time),mean(data$Time),max(data$Time)),labels=c("Thu","Fri","Sat"))
legend("topright", pch ="-", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

data$Voltage = as.numeric(as.character(data$Voltage))
plot(Voltage ~ Time, data, xaxt="none", ylab = "Voltage", xlab = " ", main = NULL, type = "l")
axis(1, at=c(min(data$Time),mean(data$Time),max(data$Time)),labels=c("Thu","Fri","Sat"))

data$Global_reactive_power = as.numeric(as.character(data$Global_reactive_power))
plot(Global_reactive_power ~ Time, data, xaxt="none", ylab = "Global Reactive Power", xlab = " ", main = NULL, type = "l")
axis(1, at=c(min(data$Time),mean(data$Time),max(data$Time)),labels=c("Thu","Fri","Sat"))

dev.copy(png, file = "plot4.png",width = 450, height = 450)
dev.off()