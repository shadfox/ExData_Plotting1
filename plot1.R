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

numbers <- as.numeric(dataset$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(numbers, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()