##Date;Time;Global_active_power;Global_reactive_power;
##Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3

##16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000

##Loading the data
table <- read.table("household_power_consumption.txt", 
                    header=TRUE, sep=";", 
                    stringsAsFactors=FALSE, 
                    dec=".")
##Getting right data
dataset = table[table$Date %in% c("1/2/2007","2/2/2007") ,]

dates <- strptime(paste(dataset$Date, dataset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
sub1 <- as.numeric(dataset$Sub_metering_1)
sub2 <- as.numeric(dataset$Sub_metering_2)
sub3 <- as.numeric(dataset$Sub_metering_3)
png("plot3.png", width = 480, height = 480)
plot(dates, sub1, type="l", xlab = "", ylab = "Energy sub metering")
lines(dates, sub2, type = "l", col="red")
lines(dates, sub3, type = "l", col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1, 
       lwd=2.5, 
       col=c("black", "red", "blue")
       )
dev.off()
