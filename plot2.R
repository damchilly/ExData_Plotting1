# Set working directory
setwd("~/Documents/COURSERAExploratoryDA/Project1/")
# Read text file with Household power info
tabla <-read.table("~/Documents/COURSERAExploratoryDA/Project1/household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
#Change original date format to R's Date format
tabla$Date <-as.Date(tabla$Date,"%d/%m/%Y")
#Select rows with Dates 2007-02-01 or 2007-02-02 and trim original table
tabla <-tabla[tabla$Date == "2007-02-01"| tabla$Date == "2007-02-02",]
#Change Time format to have Date and Time in the same field in R's format
tabla$Time <-strptime(paste(tabla$Date,tabla$Time), "%Y-%m-%d %H:%M:%S")
#Open plotting device PNG file
png("plot2.png", width=480, height=480,bg="white")
#Plot line graph for "Global_active_power" for selected days
plot(tabla[,"Time"], tabla[,"Global_active_power"], type="l", xlab=" ", ylab="Global active power (kilowatts)")
#Close PNG File plotting device
dev.off()

