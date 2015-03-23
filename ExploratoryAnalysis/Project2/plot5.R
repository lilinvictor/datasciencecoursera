## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate emissions for motor vehicle sources: EI.Sector like "Mobile - *Vehicle"
# Baltimore City, Maryland (fips == "24510") 
data <- merge(NEI[NEI$fips == "24510",],
			  SCC[grepl("Mobile - .*Vehicle", SCC$EI.Sector, ignore.case = TRUE),],
			  by.x = "SCC",
			  by.y = "SCC")
data <- aggregate(Emissions ~ year, data = data, sum)

# Draw plot
png(file = "plot5.png", width = 800, height = 800)

library(ggplot2)
qplot(year,
	  Emissions,
	  data = data,
	  geom = "line",
	  main = "Emissions from motor vehicle sources, Baltimore City")

dev.off()
