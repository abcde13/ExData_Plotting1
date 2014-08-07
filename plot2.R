# August 7th 2014       #
# Coursera, Exploratory #
# Week 1 Project        #
# Plot2                 #
#########################

source("ElectricPowerConsumptionAnalysis.R")

par(mfrow=c(1,1))

plot(data$Time,data$Global_active_power,type="n",xlab="",
     ylab="Global Active Power (kilowatts)")
lines(data$Time,data$Global_active_power)
dev.copy(png,"plot2.png")
dev.off()