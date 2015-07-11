
file_name <- "household_power_consumption.txt"
pwr <- read.csv (file_name, header = TRUE, sep = ";", stringsAsFactors=FALSE)
# Date are  character string since stringsAsFactors=FALSE
#year is dd/mm/yyyy. In format specification use upper case Y forlong year format
pwr$Date<-as.Date(pwr$Date,"%d/%m/%Y")
#get dates 2007-02-01 and 2007-02-02
pwr1<-pwr[pwr$Date == as.Date("2007-02-01") | pwr$Date == as.Date("2007-02-02"),]


## Make plot, annotate it and save it to a file
hist(as.numeric(pwr1$Global_active_power), col="red", main = NULL, xlab = NULL, ylab = NULL)
title(main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")     
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Close the PNG device!
