install.packages(ggplot2)
library(ggplot2)

dataDQ<-read.csv(file.choose(),header=TRUE)
head(dataDQ)
attach(dataDQ)


quartz(width=6,height=4.5)
ggplot(dataDQ,aes(x=level,y=mora))+
  geom_jitter(width = 0.25,height=0.25,shape=5)+
  scale_x_continuous(breaks=c(0:7))+
  scale_y_continuous(breaks=c(0:7))+
  labs(x="spell levels",y="mora counts")+
  geom_smooth(method="lm",se=T)

quartz(width=6,height=4.5)
ggplot(dataDQ,aes(x=level,y=sum))+
  geom_jitter(width = 0.25,height=0.25,shape=5)+
  scale_x_continuous(breaks=c(0:7))+
  scale_y_continuous(breaks=c(0:7))+
  labs(x="spell levels",y="# of voiced obstruents")+
  geom_smooth(method="lm",se=T) 
  
  