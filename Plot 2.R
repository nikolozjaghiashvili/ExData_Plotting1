## Plot 2 
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
data$Global_active_power = as.numeric(as.character(data$Global_active_power))

plot(Global_active_power ~ Time, data, xaxt="none",ylab = "Global Active Power (kilowatts)", xlab = " ", main = NULL, type = "l")
axis(1, at=c(min(data$Time),mean(data$Time),max(data$Time)),labels=c("Thu","Fri","Sat"))

dev.copy(png, file = "plot2.png",width = 480, height = 480)
dev.off()