### Choose four frequecnies you like ###

form Files
	sentence OutputDir  ./
	positive wave1 1000
	positive wave2 2000
	positive wave3 3000
	positive wave4 4000
endform

Create Sound from formula... Sine1 Mono 0 0.05 44100 sin(2*pi*'wave1'*x)
Scale peak... 0.2
sound1$=selected$("Sound")
Create Sound from formula... Sine2 Mono 0 0.05 44100 sin(2*pi*'wave2'*x)
Scale peak... 0.2
sound2$=selected$("Sound")
Create Sound from formula... Sine3 Mono 0 0.05 44100 sin(2*pi*'wave3'*x)
Scale peak... 0.1
sound3$=selected$("Sound")
Create Sound from formula... Sine4 Mono 0 0.05 44100 sin(2*pi*'wave4'*x)
Scale peak... 0.05
sound4$=selected$("Sound")
Create Sound from formula... Sine4 Mono 0 0.05 44100 sin(2*pi*'wave4'*x)
Scale peak... 0.05
sound4$=selected$("Sound")

Formula... self+Sound_'sound1$'()
Formula... self+Sound_'sound2$'()
Formula... self+Sound_'sound3$'()
Formula... self+Sound_'sound4$'()

Rename... Complex


