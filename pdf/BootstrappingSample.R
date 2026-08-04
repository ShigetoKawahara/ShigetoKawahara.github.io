# This program uses a Bootstrap method and calculates 95% percentile intervals of all the elements in a sample. The number of the original sample is n; resampling is repeated m times. 

class=c("c1","c2","c3","c4") # define all the elements
probabilities=c(0.606557377,0.049180328,0.295081967,0.049180328) # and their probabilities

n<-61 # the size of the orignal sample
m<-50000 # the number of resample

	my.boot.c1<-numeric(0)	# create a hash 
	my.boot.c2<-numeric(0)	
	my.boot.c3<-numeric(0)
	my.boot.c4<-numeric(0)

for(i in 1:m) {
	y<-sample(class,n,replace=TRUE,prob=probabilities) #resampling
	my.boot.c1[i]<-length(grep("c1",y)) # count the number of elements, and put it in the hash
	my.boot.c2[i]<-length(grep("c2",y))
	my.boot.c3[i]<-length(grep("c3",y))
	my.boot.c4[i]<-length(grep("c4",y))
		}
		
Y<-matrix(nrow=4,ncol=3) # prepare a matrix to store results

Y[1,1] <- mean(my.boot.c1) # encoding means in the first column
Y[2,1] <- mean(my.boot.c2)
Y[3,1] <- mean(my.boot.c3)
Y[4,1] <- mean(my.boot.c4)


Y[1,2-3]<-quantile(my.boot.c1,p=c(0.025,0.975))	# calculate the percentile intervals
Y[2,2-3]<-quantile(my.boot.c2,p=c(0.025,0.975)) # and store them in Y
Y[3,2-3]<-quantile(my.boot.c3,p=c(0.025,0.975))
Y[4,2-3]<-quantile(my.boot.c4,p=c(0.025,0.975))
Y # print

# If you want each value

mean<-Y[,1] # means
lower<-Y[,2] # lower bound
upper<-Y[,3] # upperbound
