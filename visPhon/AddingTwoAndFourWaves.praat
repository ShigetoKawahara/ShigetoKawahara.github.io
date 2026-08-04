### Run this bit to add two waves ###

Create Sound from formula: "wave1_1", 1, 0, 1, 44100, "0.2 * sin(pi*100*x) "

Create Sound from formula: "wave1_2", 1, 0, 1, 44100, "0.2 * sin(pi*200*x) "

Create Sound from formula: "added wave 1", 1, 0, 1, 44100, "0.2 * sin(pi*100*x) + 0.2 * sin(pi*200*x)"


#### Run this bit to add four waves ###

Create Sound from formula: "wave2_1", 1, 0, 1, 44100, "0.2 * sin(pi*100*x) "


Create Sound from formula: "wave2_2", 1, 0, 1, 44100, "0.2 * sin(pi*200*x) "

Create Sound from formula: "wave2_3", 1, 0, 1, 44100, "0.1 * sin(pi*300*x) "

Create Sound from formula: "wave2_4", 1, 0, 1, 44100, "0.05 * sin(pi*400*x) "

Create Sound from formula: "added wave ", 1, 0, 1, 44100, "0.2 * sin(pi*100*x) + 0.2 * sin(pi*200*x)+0.1 * sin(pi*300*x)+0.05 * sin(pi*400*x)"

