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

hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Plot 2
with(hpc, plot(DateTime, as.numeric(Global_active_power), 
               type = "l",
               ylab = "Global Active Power (kilowatts)",
               xlab = ""))
dev.copy(png, filename = "plot2.png")


