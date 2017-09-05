# Reading the source files....

NEI <- readRDS("summarySCC_PM25.rds")

# To find the total emissions of PM2.5 from the years 1999 to 2008 for the motor vehciles
# in Baltimore City, Maryland & Los angeles, California
# We'll subset the NEI dataset for both the cities and then bind them

LA <- subset(NEI, fips == "06037" & type == "ON-ROAD")
LA$city <- paste("California")
BALT <- subset(NEI, fips == "24510" & type == "ON-ROAD")
BALT$city <- paste("Maryland")
newdata <- rbind(BALT, LA)
newdata$year <- factor(newdata$year, levels = c("1999", "2002", "2005", "2008"))

# To visualize the total emissions of PM2.5 from the years 1999 to 2008 for CAlifornia and Maryland
# Below is the ggplot object using which the following plotting will be done

g <- ggplot(newdata, aes(year, Emissions))

# The following plot will be saved to a PNG file

png("plot3.png", width = 800, height = 500)
g + geom_col(aes(fill = year)) + facet_grid(. ~ city) + xlab("Years") +
ylab(expression('Total PM'[2.5]* ' Emissions')) +
ggtitle(expression('Total Emissions for motor vehciles in Baltimore City, Maryland & Los Angeles, California'))
dev.off()