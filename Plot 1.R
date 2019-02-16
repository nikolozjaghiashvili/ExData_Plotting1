## Plot 1
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep = ";", header= TRUE)
unlink(temp)
data1 = data[as.Date(data$Date,"%d/%m/%Y") >= as.Date("01/02/2007","%d/%m/%Y"),]
data2 = data1[as.Date(data1$Date,"%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"),]
data = data2 
datetime = paste(data$Date, data$Time)
data = cbind(datetime, data)
par(las=0, mar = c(4,4,3,1))
hist(as.numeric(as.character(data$Global_active_power)), col = "beige", xlab = "Global Active Power (kilowatts)", main = NULL)
title(main = "Global Active Power", outer = FALSE, sub = NULL)
dev.copy(png, file = "plot1.png",width = 480, height = 480)
dev.off()