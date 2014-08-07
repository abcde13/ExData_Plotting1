# August 7th 2014       #
# Coursera, Exploratory #
# Week 1 Project        #
# Plot3                 #
#########################

source("ElectricPowerConsumptionAnalysis.R")

par(mfrow=c(1,1))

png("plot3.png",width=480,height=480,units="px")
plot(data$Time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(data$Time,data$Sub_metering_1,col="black")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright",legend=c(col_names[7:9]),cex=1,pch=c(46,46,46),lwd=1,col=c("black","red","blue"))
dev.off()


