L_f=11 # Change these as you see fit
L_b=6.5 # Change these as you see fit

for(i in 1:3){	lambda=L_f*4/(2*i-1)
				freq=35000/lambda
				cat(i,"th of the front tube","freq =",freq,"\n")
				}

for(i in 1:3){	lambda=L_b*4/(2*i-1)
				freq=35000/lambda
				cat(i,"th of the back tube","freq =",freq,"\n")
				}				
