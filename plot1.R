# read in and tidy up the data
source("./gettidydata.R")

# set the appropriate rows/columns for the plot area: 1x1 for the first plot
par(mfrow = c(1,1))

# construct the Global Active Power Histogram
hist(hpcs$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

# create an output directory if necessary
if (!dir.exists("./output")) {dir.create("./output")}

# output the png file
print("Copying the active plot to ./output/plot1.png")

dev.copy(png, file = "./output/plot1.png", width=480, height=480)

# close the png output device
dev.off()
