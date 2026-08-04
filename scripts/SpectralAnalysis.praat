# Extracts intensity level from 50Hz to 500Hz with 50Hz increments

form 
	sentence Directory ./
	text textfile result.txt
endform


Create Strings as file list... wavlist 'directory$'/*.wav
number_files = Get number of strings


for i from 1 to number_files
	select Strings wavlist
	filename$ = Get string... i
	Read from file... 'directory$'/'filename$'
	soundname$ = selected$ ("Sound")
	select Sound 'soundname$'

	To Ltas... 5
	select Ltas 'soundname$'
	
		for j from 50 to 500 ##### change the range here, if necessary
			intensity = Get value at frequency... j Linear
			fileappend result.txt 'soundname$' 'tab$' 'j' 'tab$' 'intensity' 'newline$'
			j=j+49 #### change the increments here, if necessary
		endfor
	fileappend result.txt 'newline$'
endfor


	select all
	Remove