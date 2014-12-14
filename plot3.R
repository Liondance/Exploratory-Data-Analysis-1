#
# Exploratory Data Analysis
#
# Project 1 - Plot 3
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

# Plot 3

ylab <- "Energy sub metering";
xlab <- "";
with(data,  plot(Time, Sub_metering_1, col="black", xlab=xlab, ylab=ylab, type="l"))
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty=1,
    pt.cex=1.2, cex=1, text.width=1.4*strwidth("Sub_metering_X"),
    col=c("black", "red", "blue"),
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

# Save plot to file
dev.copy(png, width=480, height=480, "plot3.png");
dev.off();
