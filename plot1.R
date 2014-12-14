#
# Exploratory Data Analysis
#
# Project 1 - Plot 1
#

#
# Data loading and basic pre-processing
#

# Read entire dataset ("?" means NA, note separator as ";", read.csv2 also works)
data <- read.csv("Data/household_power_consumption.txt", sep = ";", na.strings = "?");

# Convert data$Time to proper timestamp
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S");

# Convert data$Date to proper Date (yes, now redundant with timestamp, so what?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y");

# Save pre-processed dataset for future studies (not used for this assignment!)
# write.csv(data, "Data/Household Power Consumption UCI.csv");

# Remove all observations, except for the two days needed (free memory!)
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ];

# Plot 1

title <- "Global Active Power";
xlab <- paste(title, "(kilowatts)");
ylab <- "Frequency";
hist(data$Global_active_power, col="red", main=title, xlab=xlab, ylab=ylab)

# Save plot to file
dev.copy(png, width=480, height=480, "plot1.png");
dev.off();
