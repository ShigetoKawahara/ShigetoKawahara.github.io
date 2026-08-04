# This praat script combines one suffix sound at the end of all other stem files.
# To use, simply specify the folder at issue, and the name of the suffix sound which 
# should be located in the same folder.
# There needs to be a pre-existing output folder. You can use the same folder for 
# the input and the output folder, but the folder may be cluttered
#
# Author: Shigeto Kawahara
# Ver. 3/23/2010



form Files
	sentence InputDir ./
	sentence OutputDir ./
	word Suffix suffix.wav
endform

# this lists everything in the directory into what's called a Strings list 
# and counts how many there are

Create Strings as file list... list 'inputDir$'*.wav
numberOfFiles = Get number of strings

# Beginning of loop

for ifile to numberOfFiles

	# opens the first file

	select Strings list
	fileName$ = Get string... ifile
	Read from file... 'inputDir$''fileName$'
	sound1$=selected$("Sound")

	# open the suffix and attach

	if fileName$ <> suffix$
		Read from file... 'inputDir$''suffix$'
		sound2$=selected$("Sound")
		select Sound 'sound1$'
		plus Sound 'sound2$'
		Concatenate
		name$ = fileName$ - ".wav"
		Write to WAV file... 'outputDir$''name$'_suffixed.wav
	endif

	# then remove all the objects except the strings list so praat isn't all cluttered up

	select all
	minus Strings list
	Remove

endfor

# at the very end, remove any other objects sitting around - like the strings list

select all
Remove
