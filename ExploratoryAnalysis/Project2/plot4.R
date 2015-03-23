## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate emissions for coal combustion related sources
data <- merge(NEI,
			  SCC[grepl("coal.*combustion", SCC$Short.Name, ignore.case = TRUE),],
			  by.x = "SCC",
			  by.y = "SCC")
data <- aggregate(Emissions ~ year, data = data, sum)

# Draw plot
png(file = "plot4.png", width = 800, height = 800)

library(ggplot2)
qplot(year,
	  Emissions,
	  data = data,
	  geom = "line",
	  main = "Emissions from coal combustion related sources")

dev.off()
