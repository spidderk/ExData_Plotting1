# read in and tidy up the data
source("./gettidydata.R")

#set the appropriate rows/columns for the plot area: 2x2 for the fourth plot
par(mfcol = c(2,2))

#construct the upper left Global Active Power line plot
plot(hpcs$datetime,hpcs$Global_active_power,type="l", ylab="Global Active Power", xlab="") 

#construct the lower left Energy Sub Metering line plots
plot(hpcs$datetime,hpcs$Sub_metering_1,type="l", ylab="Energy sub metering",xlab="")
lines(hpcs$datetime,hpcs$Sub_metering_2,type="l", col="red")
lines(hpcs$datetime,hpcs$Sub_metering_3,type="l", col="blue")
#add the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col = c("black", "red", "blue"),lty=1, lwd=1, box.lwd=0)

#construct the upper right Voltage line plot
plot(hpcs$datetime,hpcs$Voltage,type="l", ylab="Voltage",xlab="datetime",main="")

#construct the lower right Global Reactive Power line plot
plot(hpcs$datetime,hpcs$Global_reactive_power,type="l", ylab="Global_reactive_power",xlab="datetime",main="")

# create an output directory if necessary
if (!dir.exists("./output")) {dir.create("./output")}

# output the png file
print("Copying the active plot to ./output/plot4.png")
dev.copy(png, file = "./output/plot4.png", width=480, height=480)

#turn off the png output device
dev.off()
