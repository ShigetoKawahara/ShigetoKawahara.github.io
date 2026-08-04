# This script helps you to check the annotation.
# It assumes that there are pairs of sound files and TextGrid files with the same names.
# It opens every pair in the specified folder, allow you to edit them, and save the changes automatically.
# Author: Shigeto Kawahara
# Date: 4/27/2010
 

form Check the annotation files you've already created!
	sentence Directory ./
endform

Create Strings as file list... wavlist 'directory$'/*.wav
number_files = Get number of strings
 

for i from 1 to number_files
	select Strings wavlist
	filename$ = Get string... i
	Read from file... 'directory$'/'filename$'
	soundname$ = selected$ ("Sound")

	Read from file... 'directory$'/'soundname$'.TextGrid
	gridname$=selected$("TextGrid")

	select Sound 'soundname$'
	plus TextGrid 'gridname$'

	Edit
     	pause  Check the annotation. Click continue when you're done.

	select TextGrid 'gridname$'
    	Write to text file... 'directory$'/'soundname$'.TextGrid

	select all
	minus Strings wavlist
     	Remove
endfor
 
select all
Remove
