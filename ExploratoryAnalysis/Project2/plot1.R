## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate emissions by year
data <- aggregate(Emissions ~ year, data = NEI, sum)

# Draw plot
png(file = "plot1.png", width = 800, height = 800)

plot(data$year,
	 data$Emissions,
	 type = "b",
	 main = "Total PM2.5 emissions by year",
	 xlab = "Year",
	 ylab = "Total emissions")

dev.off()
