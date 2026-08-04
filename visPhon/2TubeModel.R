tubelength=17.5
c=35000
f1_f<-c();f2_f<-c();f3_f<-c()


### Front tube ###

for(i in seq(from=1, to=17, by=0.1)){
		
		fronttube=i
		lambda1_f=fronttube*4
		freq1_f=c/lambda1_f
		f1_f<-c(f1_f,freq1_f)
		
		lambda2_f=fronttube*4/3
		freq2_f=c/lambda2_f
		f2_f<-c(f2_f,freq2_f)
		
		lambda3_f=fronttube*4/5
		freq3_f=c/lambda3_f
		f3_f<-c(f3_f,freq3_f)
}

quartz(width=6,height=6)
plot(f1_f,ylim=c(0,6000),xlab="front tube length (mm)", type="l",xaxt="n",ylab="Frequency (Hz)")
axis(side=1,at=c(20,40,60,80,100,120,140,160),labels=c(2,4,6,8,10,12,14,16))

par(new=T) 
plot(f2_f,ylim=c(0,6000),ylab="",xlab="", xaxt="n",type="l")
par(new=T) 
plot(f3_f,ylim=c(0,6000),ylab="",xlab="",xaxt="n",type="l") 

### Back tube ###
f1_b<-c();f2_b<-c();f3_b<-c()

for(i in seq(from=1, to=17, by=0.1)){
		
		backtube=tubelength-i
		lambda1_b=backtube*4
		freq1_b=c/lambda1_b
		f1_b<-c(f1_b,freq1_b)
		
		lambda2_b=backtube*4/3
		freq2_b=c/lambda2_b
		f2_b<-c(f2_b,freq2_b)
		
		backtube=tubelength-i
		lambda3_b=backtube*4/5
		freq3_b=c/lambda3_b
		f3_b<-c(f3_b,freq3_b)
}

par(new=T) 
plot(f1_b,ylim=c(0,6000),ylab="",xlab="", xaxt="n",type="l",lwd = 4)
par(new=T) 
plot(f2_b,ylim=c(0,6000),ylab="",xlab="", xaxt="n",type="l",lwd = 4)
par(new=T) 
plot(f3_b,ylim=c(0,6000),ylab="",xlab="", xaxt="n",type="l",lwd = 4) 
