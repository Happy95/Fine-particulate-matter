# Reading the source files....

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# To find the total emissions of PM2.5 from the years 1999 to 2008 for the motor vehciles in Baltimore City
# we'll have to subset NEI dataset & apply the tapply function to summarize the data for each year

BALT <- subset(NEI, fips == 24510 & type == "ON-ROAD")
x <- tapply(NEI$Emissions, NEI$year, sum)

# The following plot will be saved to a PNG file
png("plot5.png", width = 650, height = 600)
XX <- barplot(g, col = c(2, 4, 6, 8), ylim = c(0,400), xlab = "Years",
ylab = expression('Total PM'[2.5]* ' Emissions'),
main = expression('Total PM'[2.5]* ' Emissions of Motor vehciles in Baltimore City, Maryland'))
text(x = XX, y = c(346.8, 134.3, 130.4, 88.3),
     labels = c(346.8, 134.3, 130.4, 88.3), pos = 3)
dev.off()