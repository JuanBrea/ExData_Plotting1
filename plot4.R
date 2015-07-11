
file_name <- "household_power_consumption.txt"
pwr <- read.csv (file_name, header = TRUE, sep = ";", stringsAsFactors=FALSE)
# Date are  character string since stringsAsFactors=FALSE
#year is dd/mm/yyyy. In format specification use upper case Y forlong year format
pwr$Date<-as.Date(pwr$Date,"%d/%m/%Y")
#get dates 2007-02-01 and 2007-02-02
pwr1<-pwr[pwr$Date == as.Date("2007-02-01") | pwr$Date == as.Date("2007-02-02"),]


## Make plot, annotate it and save it to a file
## There will be 4 plots: 2 rows and 2 columns
windows()
par(mfrow = c(2,2))
par("bg"="white")

## Make plot, annotate it and save it to a file


## Generate Time Vector "T"
T<-strptime(paste(as.character(pwr1$Date),pwr1$Time), format="%Y-%m-%d %H:%M:%S")

##Plot 1,1
## tyle = "l" so points are joined by a line

plot(T,as.numeric(pwr1$Global_active_power),  type="l", main = " ", xlab = " ", ylab = "Global Active Power (Kilowats")

##Plot 1,2
plot(T,as.numeric(pwr1$Voltage),  type="l", main = " ", xlab = "datetime", ylab = "Voltage")

##Plot 2,1
## tyle = "l" so points are joined by a line
plot(T,as.numeric(pwr1$Sub_metering_1),  type="l", main = " ", xlab = " ", ylab = "Energy sub metering")
lines(T, as.numeric(pwr1$Sub_metering_2), col ="red")
lines(T, as.numeric(pwr1$Sub_metering_3), col ="blue")
The_legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
The_colors = c("black", "red","blue")
lwdh=c(1,1,1)
text_size = c(0.7, 0.7, 0.7)
legend("topright", legend = The_legend , cex = text_size, lwd = lwdh, col =The_colors)


##Plot 2,2
plot(T,as.numeric(pwr1$Global_reactive_power),  type="l", main = " ", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Close the PNG device!

## Reset to one plot
par(mfrow = c(1,1))

