# Calculates the duration of all intervals of all the files in a specified folder.
# All you need is a set of TextGrid files. 
# Author: Shigeto Kawahara
# Ver. 10/3/2010 (supercedes the previous versions)


form Calculate durations of labeled segments
	sentence directory ./
	comment The name of the result file
	text textfile Result.txt
endform


#Read all files in a folder
Create Strings as file list... gridlist 'directory$'/*.TextGrid
n = Get number of strings

for i to n
clearinfo

#Loop through files
	select Strings gridlist
	gridname$ = Get string... i
	Read from file... 'directory$'/'gridname$'
	soundname$ = selected$ ("TextGrid")

	fileappend "'textfile$'" 'soundname$''tab$'
	
# We then calculate the durations

	int=Get number of intervals... 1

	for k from 1 to 'int'
		select TextGrid 'soundname$'

		label$ = Get label of interval... 1 'k'
		if label$ <> ""
			# calculates the onset and offset
 			onset = Get starting point... 1 'k'
  			offset = Get end point... 1 'k'
       
			# calculates duration		
			dur = offset-onset
			fileappend "'textfile$'" 'label$''tab$''dur''tab$'
		endif
	endfor

fileappend "'textfile$'" 'newline$'
endfor

# clean up
select all
Remove