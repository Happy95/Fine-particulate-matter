# Reading the source files....

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# A subset of PM2.5 emissions data will be created, particularly for baltimore city, Maryland

BALT <- subset(NEI, fips == 24510)

# To find the total emissions of PM2.5 from the years 1999 to 2008 from all sources
# we'll apply the tapply function to summarize the data for each year

x <- tapply(BALT$Emissions, BALT$year, sum)

# The following plot will be saved to a PNG file

png("plot2.png")
barplot(x, xlab = "Years", ylab = expression('Total PM'[2.5]* ' emissions'),
        main = expression('Total PM'[2.5]*'emissions in Baltimore City, Maryland'))
dev.off()