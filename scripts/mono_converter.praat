# This script converts all the files in a specified folder into mono files. 
# written by Shigeto Kawahara. version 4/7/2009


form mono converter
	sentence Directory /Users/shigetokawahara/
endform



Create Strings as file list... list 'directory$'
numberOfFiles = Get number of strings
for ifile to numberOfFiles

	select Strings list
	fileName$ = Get string... ifile
	Read from file... 'directory$''fileName$'

	Convert to mono
	Write to WAV file... 'directory$''fileName$'

	select all
	minus Strings list
	Remove

endfor

select all
Remove
