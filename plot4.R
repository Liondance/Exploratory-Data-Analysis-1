#
# Exploratory Data Analysis
#
# Project 1 - Plot 4
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

# Plot 4

# Layout 2x2 grid, populating by columns
par(mfcol=c(2, 2));

# Upper left
ylab <- "Global Active Power";
xlab <- "";
plot(data$Time, data$Global_active_power, xlab=xlab, ylab=ylab, type="l")

# Lower left
ylab <- "Energy sub metering";
xlab <- "";
with(data,  plot(Time, Sub_metering_1, col="black", xlab=xlab, ylab=ylab, type="l"))
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))
legend("topright", bty="n", lty=1,
       pt.cex=1, cex=0.75, text.width=1.1*strwidth("Sub_metering_X"),
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

# Upper right
xlab <- "datetime";
with(data, plot(Time, Voltage, xlab=xlab, type="l"))

# Lower right
xlab <- "datetime";
with(data, plot(Time, Global_reactive_power, xlab=xlab, type="l"))

# Save plot to file
dev.copy(png, width=480, height=480, "plot4.png");
dev.off();
