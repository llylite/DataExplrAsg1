library('data.table')
library('ggplot2')

hpc = read.csv('hpc.csv')
p2 = ggplot(hpc, aes(x=X, y=Global_active_power), margins = F) + 
  geom_line(colour="black") + labs(y = "Global Active Power (kilowatts)", x = '')
p2 = p2 + theme_classic() +  
  theme(panel.border = element_rect(colour = "black", fill=NA),axis.text.y = element_text(angle = 90,hjust=.5)) +
  scale_x_continuous(breaks=0:2, labels=c("Thu", "Fri", "Sat")) 

p4 = ggplot(hpc, aes(x=X, y=Voltage), margins = F) + 
  geom_line(colour="black") + labs( x = 'datetime')
p4 = p4 + theme_classic() + 
  scale_x_continuous(breaks=0:2, labels=c("Thu", "Fri", "Sat")) + 
  theme(panel.border = element_rect(colour = "black", fill=NA),axis.text.y = element_text(angle = 90,hjust=.5))

p5 = ggplot(hpc, aes(x=X, y=Global_reactive_power), margins = F) + 
  geom_line(colour="black") + labs( x = 'datetime')
p5 = p5 + theme_classic() + 
  scale_x_continuous(breaks=0:2, labels=c("Thu", "Fri", "Sat")) + 
  theme(panel.border = element_rect(colour = "black", fill=NA),axis.text.y = element_text(angle = 90,hjust=.5))

library('gridExtra')
p3 = p + theme(legend.position=c(.827, .805)) 
grid.arrange(p2, p4, p3, p5, ncol=2)
p3 = p + theme(legend.position=c(.775, .825),legend.text=element_text(size=8)) 
png("plot4.png")
grid.arrange(p2, p4, p3, p5, ncol=2)
dev.off()
