# Exponential

x<-c()
y<-c()

for(i in seq(from=-2, to=5, by=00.1)){
	
	x<-c(x,i)
	y<-c(y,y=exp(i))

}
par(mfg=c(1,2))

plot(x,y,main="Exponential function",type="l")

# Linear
par(new=T) 
abline(a=20,b=5)


# Log

x<-c()
y<-c()

for(i in seq(from=0, to=1000, by=1)){
	
	
	x<-c(x,i)
	y<-c(y,y=log(i,base=10))
	
}

plot(x,y,main="Logarithmic function",type="l")