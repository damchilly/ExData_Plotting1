# Set working directory
setwd("~/Documents/COURSERAExploratoryDA/Project1/")
# Read text file with Household power info
tabla <-read.table("~/Documents/COURSERAExploratoryDA/Project1/household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
#Change original date format to R's Date format
tabla$Date <-as.Date(tabla$Date,"%d/%m/%Y")
#Select rows with Dates 2007-02-01 or 2007-02-02 and trim original table
tabla <-tabla[tabla$Date == "2007-02-01"| tabla$Date == "2007-02-02",]
#Open plotting device PNG file
png("plot1.png", width=480, height=480,bg="white")
#Plot histogram for "Global_active_power" for selected days
hist(tabla[,"Global_active_power"], main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
#Close PNG File plotting device
dev.off()

