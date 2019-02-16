## Plot 3 
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep = ";", header= TRUE)
unlink(temp)
data1 = data[as.Date(data$Date,"%d/%m/%Y") >= as.Date("01/02/2007","%d/%m/%Y"),]
data2 = data1[as.Date(data1$Date,"%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"),]
data = data2 
datetime = paste(data$Date, data$Time)
data = cbind(datetime, data)
data$datetime = strptime(data$datetime, "%d/%m/%Y %H:%M:%S")
data$Time = as.numeric(data$datetime)
data$Sub_metering_1 = as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 = as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 = as.numeric(as.character(data$Sub_metering_3))

plot(Sub_metering_1 ~ Time, data, xaxt="none",ylab = "Energy Sub metering", xlab = " ", main = NULL, type = "l", col = "black")
lines(Sub_metering_2 ~ Time,data, col = "red")
lines(Sub_metering_3 ~ Time,data, col = "blue")
axis(1, at=c(min(data$Time),mean(data$Time),max(data$Time)),labels=c("Thu","Fri","Sat"))
legend("topright", pch ="-", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png",width = 480, height = 480)
dev.off()