# Reading the source files....

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Loading ggplot2 package....
library(ggplot2)

# A subset of PM2.5 emissions data will be created, particularly for baltimore city, Maryland

BALT <- subset(NEI, fips == 24510)
BALT$year <- factor(BALT$year, levels=c('1999', '2002', '2005', '2008'))

# To visualize the total emissions of PM2.5 from the years 1999 to 2008 for all types of sources
# Below is the ggplot object using which the following plotting will be done
g <- ggplot(BALT, aes(year))

# The following plot will be saved to a PNG file

png("plot3.png", width = 800, height = 550)
g + geom_bar(aes(weight = Emissions, fill = type)) + facet_grid(. ~ type) +
xlab("Years") + ylab(expression('Total PM'[2.5]* 'Emissions')) +
ggtitle(expression('Total PM'[2.5]* 'Emissions per type in Baltimore City, Maryland'))
dev.off()