# This Praat assumes that there is a rise and a fall at each interval
# as in the case with Japanese sentences with accented nouns.
# The script will initial min F0, max F0 and final min F0.
# This script analayzes all the files in a specifid folder.
# Date: 6 March 2009
# Author: MATSUURA Toshio (modified by Shigeto Kawahara, 4/9/2009)
# Input: TextGrid and wav (must have the same name) in the same directly.

form Get F0 Min-Max-Min
	sentence Directory ./
	word Base_file_name 
	comment The name of result file (don't change this)
	text textfile F0_list.txt
endform


#Read all files in a folder
Create Strings as file list... wavlist 'directory$'/'base_file_name$'*.wav
Create Strings as file list... gridlist 'directory$'/'base_file_name$'*.TextGrid
n = Get number of strings

for i to n
clearinfo
#We first extract pitch tiers
	select Strings wavlist
	filename$ = Get string... i
	Read from file... 'directory$'/'filename$'
	soundname$ = selected$ ("Sound")
	To Pitch... 0.01 75 400
	output$ = "'soundname$'.Pitch"
	# Write to binary file... 'output$'

# We now read grid files and extract all intervals in them
	select Strings gridlist
	gridname$ = Get string... i
	Read from file... 'directory$'/'gridname$'
	int=Get number of intervals... 1

# calculates F0 max, and F0 min before and after F0 max
for k from 1 to 'int'
	select TextGrid 'soundname$'
	label$ = Get label of interval... 1 'k'
	if label$ <> ""
		startTime = Get starting point... 1 'k'
		endTime = Get end point... 1 'k'
		select Pitch 'soundname$'
		f0max = Get maximum... startTime endTime Hertz Parabolic
		maxTime = Get time of maximum... startTime endTime Hertz Parabolic
		f0minPre = Get minimum... startTime maxTime Hertz Parabolic
		f0minPost = Get minimum... maxTime endTime Hertz Parabolic
		resultline$ = "'soundname$''tab$''label$''tab$''startTime''tab$''endTime''tab$''f0minPre''tab$''f0max''tab$''f0minPost''"
		fileappend "'textfile$'" 'resultline$'
	endif
endfor

fileappend "'textfile$'" 'newline$'


	
endfor

# write the footer line
for k from 1 to 'int'
	fileappend "'textfile$'" soundname'tab$'label'tab$'startTime'tab$'endTime'tab$'f0minpre'tab$'f0max'tab$'f0minpost 
endfor

# clean up

select all
Remove