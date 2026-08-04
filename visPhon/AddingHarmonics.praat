form Wave Form Synthesis
	comment Adding Harmonics
	sentence Directory ./
	comment What the frequency of the lowest component?
	positive F0 800
	comment How many harmonics do you want?
	positive Number_of_harmonics 10
	comment Do you want attenuate high frequency components?
	boolean Attenuate No
	comment What do you want to name the output file?
	word Output_file_name File
endform

for i from 1 to number_of_harmonics

	freq = i*f0
	printline 'i' 'freq'

	if attenuate = 0
		Create Sound... sine'freq' 0 0.2 44100 sin(2*pi*freq*x)
		else
		Create Sound... sine'freq' 0 0.2 44100 (1/((2*i)-1))*sin(2*pi*freq*x)
	endif

	select Sound sine'freq'
	if i > 1
		Formula... self[col] + Sound_old[col]
	endif
	Rename... old
endfor


Scale peak... 0.8
Write to WAV file... 'directory$''output_file_name$'_HarmonicSeries.wav

select all
Remove

Read from file... 'directory$''output_file_name$'_HarmonicSeries.wav
