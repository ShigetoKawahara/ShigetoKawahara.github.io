
# Simple sine wave

x <- seq(0*pi,2*pi, length=1000)
y <- sin(x)
plot(x, y,type="l",xlab="",ylab="sin(x)", xaxt="n")
abline(0,0)
text(0, -0.2, "0")
text(1.57, -0.2, "90")
text(3.14, -0.2, "180")
text(4.71, -0.2, "270")
text(6.28, -0.2, "360")


# New sine waves

x <- seq(0*pi,4*pi, length=1000)
y <- sin(x)
plot(x, y,type="l",xlab="",ylab="", ylim=c(-2,2),xaxt="n")
abline(0,0)

x <- seq(0*pi,4*pi, length=1000)
y <- 2*sin(x)
plot(x, y,type="l",xlab="",ylab="", ylim=c(-2,2),xaxt="n")
abline(0,0)


# Two sine waves
par(mfrow=c(2,1))
x <- seq(0*pi, 4*pi, length=1000)
y <- sin(x)
z <- sin(x+1/2*pi)

plot(x, y,type="l",xlab="x",ylab="sin(x)")
abline(0,0)
plot(x, z,type="l",xlab="x",ylab="sin(x)")
abline(0,0)


