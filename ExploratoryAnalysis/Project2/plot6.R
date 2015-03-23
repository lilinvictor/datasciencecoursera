## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate emissions for motor vehicle sources: EI.Sector like "Mobile - *Vehicle"
# Baltimore City, Maryland (fips == "24510")
# Los Angeles County, California (fips == "06037")
data <- merge(NEI[NEI$fips == "24510" | NEI$fips == "06037",],
			  SCC[grepl("Mobile - .*Vehicle", SCC$EI.Sector, ignore.case = TRUE),],
			  by.x = "SCC",
			  by.y = "SCC")
data <- aggregate(Emissions ~ year + fips, data = data, sum)

# Draw plot
png(file = "plot6.png", width = 800, height = 800)

library(ggplot2)
qplot(year,
	  Emissions,
	  color = fips,
	  data = data,
	  geom = "line",
	  main = "Emissions from motor vehicle sources, Baltimore (24510) vs Los Angeles (06037)")

dev.off()
