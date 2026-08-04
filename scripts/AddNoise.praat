# This script superimposes a noise file onto all the sound files in a specified folder.
# To use, prepare an input folder with all the sound files and a noise file.
# The noise file should be named "noise.wav"
# The script automatically adjust the duration of the noise file to each target file by PSOLA.
# You can specify a folder that's different from an input folder if you like. 
# Ver. 9/22/2010. Author: Shigeto Kawahara

form Files
	sentence Directory  ./
	sentence OutputDir  ./
endform

Create Strings as file list... list 'directory$'*.wav
numberOfFiles = Get number of strings

for i to numberOfFiles

select Strings list
	filename$ = Get string... i
	Read from file... 'directory$'/'filename$'
	sound$=selected$("Sound")

	Read from file... 'directory$'/noise.wav
	select Sound noise
	noise$=selected$("Sound")

# Adjust the duration of noise to the target file
	select Sound 'sound$'
		durTarget=Get total duration
	select Sound 'noise$'
		durNoise=Get total duration
	ratio=durTarget/durNoise
	select Sound 'noise$'
	Lengthen (overlap-add)... 75 600 'ratio'
	noiseL$=selected$("Sound")

#  Get sampling frequency
	select Sound 'sound$'
	sampFreq=Get sampling frequency
	Create Sound from formula... base Mono 0 durTarget sampFreq 0
	
# Now add the sound and noise together
	Formula... self+Sound_'sound$'()
	Formula... self+Sound_'noiseL$'()

	if sound$ <> noise$
	Write to WAV file... 'outputDir$''sound$'_n.wav
	endif
endfor

select all
Remove