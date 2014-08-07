# August 7th 2014       #
# Coursera, Exploratory #
# Week 1 Project        #
# Plot3                 #
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

par(mfrow=c(1,1))

png("plot3.png",width=480,height=480,units="px")
plot(data$Time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(data$Time,data$Sub_metering_1,col="black")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright",legend=c(col_names[7:9]),cex=1,pch=c(46,46,46),lwd=1,col=c("black","red","blue"))
dev.off()


