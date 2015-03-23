## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate emissions by year for Baltimore City, Maryland (fips == "24510")
data <- NEI[NEI$fips == "24510",]
data <- aggregate(Emissions ~ year, data = data, sum)

# Draw plot
png(file = "plot2.png", width = 800, height = 800)

plot(data$year,
	 data$Emissions,
	 type = "b",
	 main = "Total PM2.5 emissions for Baltimore City, Maryland",
	 xlab = "Year",
	 ylab = "Total emissions")

dev.off()
