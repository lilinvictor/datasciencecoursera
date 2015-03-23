## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate emissions by year for Baltimore City, Maryland (fips == "24510")
data <- NEI[NEI$fips == "24510",]
data <- aggregate(Emissions ~ year + type, data = data, sum)

# Draw plot
png(file = "plot3.png", width = 800, height = 800)

library(ggplot2)
qplot(year,
	  Emissions,
	  data = data,
	  color = type,
	  geom = "line",
	  main = "Emissions trend by type, Baltimore City")

dev.off()
