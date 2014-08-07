# August 7th 2014       #
# Coursera, Exploratory #
# Week 1 Project        #
# Plot1                 #
#########################

source("ElectricPowerConsumptionAnalysis.R")


hist(data$Global_active_power,col="red",main="Global Active Power",xlab=
         "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()