library('ggplot2')

hpc = read.csv('hpc.csv')

hpc3=hpc[,c(11, 8:10)]
d3 <- melt(hpc3, id="X")
p = ggplot(d3, aes(X, value, colour=variable)) + 
  geom_line() + scale_colour_manual(values=c('black','red', "blue")) + theme_classic() + 
  labs(y = "Energy sub metering", x = '') + scale_x_continuous(breaks=0:2, labels=c("Thu", "Fri", "Sat")) + 
  theme(legend.background = element_rect(colour = "black"), legend.title = element_blank(), 
        panel.border = element_rect(colour = "black", fill=NA),axis.text.y = element_text(angle = 90,hjust=.5))
p3 = p + theme(legend.position=c(.9397, .9353)) 
ggsave(file='plot3.png',p3)
p3 = p + theme(legend.position=c(.9, .9)) 
p3
