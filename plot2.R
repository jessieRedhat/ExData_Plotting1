

setwd("c:/Users/Hamid/Documents/r/")

CC2 <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

dtA <- read.table( "household_power_consumption.txt",  
                   na.strings = "?", colClasses = CC2, sep = ";",header = TRUE )
dt <- dtA[grep("^[1|2]{1}/2/2007",readLines("household_power_consumption.txt"))-1,  ]

x <- paste(dt[,1],dt[,2])

dt[,1] <- as.POSIXct(x,format = "%d/ %m/ %Y %H:%M:%S",tz="") 


dt <- dt[,c(1,3,4,5,6,7,8,9)]

library(ggplot2)
library(datasets)
with(faithful, plot(dt$Date,dt$Global_active_power,xlab = "",
                    ylab = "Global Active power (kilowatts)",type = "l" ))

dev.copy(png, file = "Plot2.png")
dev.off()
