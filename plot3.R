# read in and tidy up the data
source("./gettidydata.R")

# set the appropriate rows/columns for the plot area: 1x1 for the third plot
par(mfrow = c(1,1))

#construct the Energy Sub Metering line plots
plot(hpcs$datetime,hpcs$Sub_metering_1,type="l", ylab="Energy sub metering",xlab="",main="")
lines(hpcs$datetime,hpcs$Sub_metering_2,type="l", col="red")
lines(hpcs$datetime,hpcs$Sub_metering_3,type="l", col="blue")

#add the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col = c("black", "red", "blue"),lty=1, lwd=1)

# create an output directory if necessary
if (!dir.exists("./output")) {dir.create("./output")}

# output the png file
print("Copying the active plot to ./output/plot3.png")
dev.copy(png, file = "./output/plot3.png", width=480, height=480)

# close the png output device
dev.off()
