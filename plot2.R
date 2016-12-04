# read in and tidy up the data
source("./gettidydata.R")

# set the appropriate rows/columns for the plot area: 1x1 for the second plot
par(mfrow = c(1,1))

# construct the Global Active Power line plot
plot(hpcs$datetime,hpcs$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xlab="",main="")

# create an output directory if necessary
if (!dir.exists("./output")) {dir.create("./output")}

# output the png file
print("Copying the active plot to ./output/plot2.png")
dev.copy(png, file = "./output/plot2.png", width=480, height=480)

# close the png output device
dev.off()
