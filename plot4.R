# August 7th 2014       #
# Coursera, Exploratory #
# Week 1 Project        #
# Plot4                 #
#########################

#source("ElectricPowerConsumptionAnalysis.R")
#Can't just source, per instructions

# First, get colnames
col_names <- colnames(read.table("household_power_consumption.txt",sep=";",header=T,
                                 nrow=2))

# First Skip 66636 , stop at 69515 (calculated at terminal)
to_skip <- 66636
to_read <- 69515-66636

# Read data given skip and rows now
data <- read.table("household_power_consumption.txt",header=T,sep=";",skip=to_skip,
                   nrows=to_read+1,col.names=col_names,na.strings = "?")

data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Time <- apply(data,1,function(x) { paste(x[1],x[2])})
data$Time <- strptime(data$Time,"%Y-%m-%d %H:%M:%S")


par(mfrow = c(2,2))


#plot 1
plot(data$Time,data$Global_active_power,type="n",xlab="",
     ylab="Global Active Power")
lines(data$Time,data$Global_active_power)

#plot 2
plot(data$Time,data$Voltage,type="n",xlab="",
     ylab="Voltage")
lines(data$Time,data$Voltage)

#plot3
plot(data$Time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(data$Time,data$Sub_metering_1,col="black")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright",legend=c(col_names[7:9]),cex=.31,pch=c(46,46,46),lwd=1,col=c("black","red","blue"))

#plot 4
plot(data$Time,data$Global_reactive_power,type="n",xlab="",
     ylab="Global_reactive_power")
lines(data$Time,data$Global_reactive_power)
dev.copy(png,"plot4.png")
dev.off()