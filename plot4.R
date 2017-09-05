# Reading the source files....

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Loading ggplot2 package....
library(ggplot2)

# To fetch data from the SCC dataset for the coal combustion related sources and subset NEI dataset
newSCC <- SCC[grepl("coal", SCC$EI.Sector, ignore.case = TRUE), ]
newdata <- NEI[NEI$SCC %in% newSCC$SCC, ]
newdata$year <- factor(newdata$year, levels=c('1999', '2002', '2005', '2008'))

# To visualize the total emissions of PM2.5 from the years 1999 to 2008 for the coal combustion sources
# Below is the ggplot object using which the following plotting will be done

g <- ggplot(newdata, aes(year, log10(Emissions)))

# The following plot will be saved to a PNG file
png("plot3.png", width = 500, height = 500)
g + geom_boxplot(aes(fill = year)) + stat_boxplot(geom = "errorbar") +
ylab(expression('Log10 PM'[2.5]* 'Emissions')) +
ggtitle(expression('Total PM'[2.5]* 'Emissions for coal combustion in United states'))
dev.off()