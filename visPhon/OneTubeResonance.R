tubelength=17.5

for(i in 1:5){	lambda=tubelength*4/(2*i-1)
				freq=35000/lambda
				cat(i,"th","lambda =",lambda, "cm","\n")
				cat(i,"th","freq =",freq," Hz","\n")
}
