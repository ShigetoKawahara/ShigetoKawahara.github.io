form Wave Form Synthesis
	comment Adding Harmonics
	sentence Directory ./
	comment What the frequency of the lowest component?
	positive F0 50
	comment How many harmonics do you want?
	positive Number_of_harmonics 50
endform
clearinfo

for i from 1 to number_of_harmonics

	freq = (2*i-1)*f0
	printline 'i' 'freq'

	
	Create Sound... sine'freq' 0 0.2 44100 sin(2*pi*freq*x)
	Scale peak... 0.2/(2*i-1)

	select Sound sine'freq'
	if i > 1
		Formula... self[col] + Sound_old[col]
	endif
	Rename... old
endfor



Write to WAV file... 'directory$'SqureWave.wav

select all
Remove

Read from file... 'directory$'SqureWave.wav
