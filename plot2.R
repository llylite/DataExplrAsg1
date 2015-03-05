library('ggplot2')

hpc = read.csv('hpc.csv')
p2 = ggplot(hpc, aes(x=X, y=Global_active_power), margins = F) + 
  geom_line(colour="black") + labs(y = "Global Active Power (kilowatts)", x = '')
p2 = p2 + theme_classic() +  
  theme(panel.border = element_rect(colour = "black", fill=NA),axis.text.y = element_text(angle = 90,hjust=.5)) +
  scale_x_continuous(breaks=0:2, labels=c("Thu", "Fri", "Sat")) 
p2 
ggsave(file='plot2.png',p2)
