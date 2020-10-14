## Creating data folder
if(!file.exists("./data")){dir.create("./data")}
setwd("./data")

## Download and unzip the dataset
filename <- "household_power_consumption.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
  unzip(filename)
}
setwd("../")

## Get data
hpc_all <- read.table("./data/household_power_consumption.txt", 
                      header = TRUE, sep = ";")

## Get data from the dates 2007-02-01 and 2007-02-02
# hpc_all$DateFormat <- strptime(hpc_all$Date, "%d/%m/%Y")
# hpc <- subset(hpc_all, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
# just simple:
hpc <- subset(hpc_all, Date == "1/2/2007" | Date == "2/2/2007")
rm(hpc_all)

## Plot 1
hist(as.numeric(hpc$Global_active_power), 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, filename = "plot1.png")

