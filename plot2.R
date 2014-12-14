#
# Exploratory Data Analysis
#
# Project 1 - Plot 2
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

# Plot 2

ylab <- "Global Active Power (kilowatts)";
xlab <- "";
plot(data$Time, data$Global_active_power, xlab=xlab, ylab=ylab, type="l")

# Save plot to file
dev.copy(png, width=480, height=480, "plot2.png");
dev.off();
