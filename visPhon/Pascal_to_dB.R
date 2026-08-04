x <- seq(0.00002,0.02, length=10000)
y <- 20*log10(x/0.00002)

quartz(height=3,width=5)
plot(x,y,xlab="Pa",ylab="dB",type="l")
