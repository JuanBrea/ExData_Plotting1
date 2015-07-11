
file_name <- "household_power_consumption.txt"
pwr <- read.csv (file_name, header = TRUE, sep = ";", stringsAsFactors=FALSE)
# Date are  character string since stringsAsFactors=FALSE
#year is dd/mm/yyyy. In format specification use upper case Y forlong year format
pwr$Date<-as.Date(pwr$Date,"%d/%m/%Y")
#get dates 2007-02-01 and 2007-02-02
pwr1<-pwr[pwr$Date == as.Date("2007-02-01") | pwr$Date == as.Date("2007-02-02"),]

## Generate Time Vector "T"
T<-strptime(paste(as.character(pwr1$Date),pwr1$Time), format="%Y-%m-%d %H:%M:%S")


## Make plot, annotate it and save it to a file
## tyle = "l" so points are joined by a line
windows()
plot(T,as.numeric(pwr1$Sub_metering_1),  type="l", main = " ", xlab = " ", ylab = "Energy sub metering")
lines(T, as.numeric(pwr1$Sub_metering_2), col ="red")
lines(T, as.numeric(pwr1$Sub_metering_3), col ="blue")
The_legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
The_colors = c("black", "red","blue")
lwdh=c(1,1,1)
text_size = c(0.7, 0.7, 0.7)
legend("topright", legend = The_legend , cex = text_size, lwd = lwdh, col =The_colors)

dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Close the PNG device!
