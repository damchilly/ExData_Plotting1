# Set working directory
setwd("~/Documents/COURSERAExploratoryDA/Project1/")
# Read text file with Household power info
tabla <-read.table("~/Documents/COURSERAExploratoryDA/Project1/household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
# Change original date format to R's Date format
tabla$Date <-as.Date(tabla$Date,"%d/%m/%Y")
# Select rows with Dates 2007-02-01 or 2007-02-02 and trim original table
tabla <-tabla[tabla$Date == "2007-02-01"| tabla$Date == "2007-02-02",]
# Change Time format to have Date and Time in the same field in R's format
tabla$Time <-strptime(paste(tabla$Date,tabla$Time), "%Y-%m-%d %H:%M:%S")
# Open plotting device PNG file
png("plot4.png", width=480, height=480,bg="white")
# Setting multiple Base plots
par(mfrow=c(2,2))
# Plot line graph "Time" ~ "Global_active_power" for selected days/times
plot(tabla[,"Time"], tabla[,"Global_active_power"], type="l", xlab=" ", ylab="Global Active Power")
##
# Plot line graph "Time" ~ "Voltage" for selected days/times
plot(tabla[,"Time"], tabla[,"Voltage"], type="l", xlab="datetime", ylab="Voltage")
##
# Plot line graph for "Time" ~ "Sub_metering_1" for selected days/times
plot(tabla[,"Time"], tabla[,"Sub_metering_1"], type="l", col="black", xlab=" ", ylab="Energy sub metering")
# Plot line graph for "Time" ~ "Sub_metering_2" for selected days/times
points(tabla[,"Time"], tabla[,"Sub_metering_2"], type="l", col="red")
# Plot line graph for "Time" ~ "Sub_metering_3" for selected days/times
points(tabla[,"Time"], tabla[,"Sub_metering_3"], type="l", col="blue")
# Add legend for each Sub_metering type
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(1, 1, 1), col=c("black","red","blue"), bty="n")
##
# Plot line graph "Time" ~ "Global_reactive_power" for selected days/times
plot(tabla[,"Time"], tabla[,"Global_reactive_power"], type="l", xlab="datetime", ylab="Global reactive power")
##
# Close PNG File plotting device
dev.off()

