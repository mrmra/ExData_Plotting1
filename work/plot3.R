## Coursera Hopkins Exploratory Data Course assignment 1: Plot 3
data <- read.csv2(".//household_power_consumption.txt", stringsAsFactor=FALSE)
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
dataSelected <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

## Clean up any NAs
dataClean <- na.omit(dataSelected)

## The data was loaded as STRINGS -- otherwise will load as FACTORS, either way
## need to convert to numeric. A mapping function to convert to numeric would be much 
## better here,just done this way now for expediency in the rough.

dataClean$Global_active_power <- as.numeric(dataClean$Global_active_power)
dataClean$Global_reactive_power <- as.numeric(dataClean$Global_reactive_power)
dataClean$voltage <- as.numeric(dataClean$voltage)
dataClean$Global_intensity <- as.numeric(dataClean$Global_intensity)
dataClean$Sub_metering_1 <- as.numeric(dataClean$Sub_metering_1)
dataClean$Sub_metering_2 <- as.numeric(dataClean$Sub_metering_2)
dataClean$Sub_metering_3 <- as.numeric(dataClean$Sub_metering_3)

## Now chart!
## Open file for PNG write
png("plot3.png")
## Cleaning up date/time stamps -- credit to forum for help on this! Setting y to keep readable
x <- strptime( paste(dataClean$Date,dataClean$Time), format="%Y-%m-%d %H:%M:%S")
y <- dataClean$Sub_metering_1
## now plot
plot.default(x,y, type="l", ylab="Energy sub metering")
lines(x,dataClean$Sub_metering_2, type="l", col="red")
lines(x,dataClean$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(2,2,2), col=c("black", "red", "blue"))
## Close file
dev.off()
