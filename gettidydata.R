# get the needed libraries -- if these are not installed, call:
# install.packages("dplyr")
# install.packages("lubridate")

library(dplyr)
library(lubridate)

# get the URL for the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# create a data directory if necessary
if (!dir.exists("./data")) {dir.create("./data")}

# if the data file does not yet exist locally, download the data
if (!file.exists("./data/power.zip")) {
  download.file(fileUrl,"./data/power.zip",method="curl")
}

# if the unzipped data file does not exist, unzip the file and place in data directory
if (!file.exists("./data/household_power_consumption.txt")) {
  unzip("./data/power.zip", exdir="./data")
}

# At this point we should have the extracted data file in the ./data directory ready to be read in

# read in the data
print("Reading large data file -- may take a moment...")
hpc <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)

# subset the dates of interest
hpcs <- subset(hpc, (Date=="1/2/2007" | Date=="2/2/2007"))

# remove the larger data set -- no longer needed
rm(hpc)

# add a column with reformated datetime using lubridate, class will be POSIXct POSIXt
# note we will make use of this later, and ignore the original Date, Time text columns
hpcs <- mutate(hpcs, datetime = dmy_hms(paste(Date, Time)))
