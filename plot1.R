library('data.table')
library('ggplot2')
hpc <- read.csv("household_power_consumption.txt",sep=";")
hpc = data.table( hpc[ hpc$Date == '1/2/2007' |  hpc$Date == '2/2/2007' , ] )

t1 = c(rep(0,1440),rep(1,1440))
hpc$X = as.double(hpc$Time)/1440 + t1

write.csv(hpc, file = "hpc.csv")

hpc = read.csv('hpc.csv')
p = ggplot(hpc, aes(x=Global_active_power), margins = F) + 
  geom_histogram(aes(y=..count..),      # Histogram with density instead of count on y-axis
                 binwidth=.5, colour="black", fill="red") 

p1 = p + theme_classic() + labs(x = "Global Active Power (kilowatts)", y = 'Frequency') + 
  scale_y_continuous(breaks=(0:6)*200) + xlim(0,8) + coord_cartesian(ylim=c(-100,1300)) + 
  theme(axis.text.y = element_text(angle = 90,hjust=.5)) 
p1
ggsave(file="plot1.png",p1)
