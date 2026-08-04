# This script counts the number of specified labels in all annotation files in a specified folder.
# To use, have all of your textgrid files in one folder.
# Specify (i) the path to the folder, (ii) which tier you want to analyze, (iii) the word that you want to 
# search for, and (iv) the name of the result file. Each time you run it, it will append a new result line to the file.
# Author: Shigeto Kawahara
# Version: 6/15/2010

form Count the number of labels
	sentence Directory ./
	comment Which tier of the TextGrid object would you like to analyse?
	integer Tier 1
	comment  What's the word that you want to serch for?
	word Word to
	comment Where do you want to save the results?
	text textfile wordcount.txt
endform


# clearout everything, and print out the word in question, set the counter to 0
clearinfo
fileappend "'textfile$'" 'word$''tab$'
sum=0


# get the number of TextGrid files for loop

Create Strings as file list... list 'directory$'/*.TextGrid
select Strings list
ns = Get number of strings

for i to ns
	select Strings list
	gridname$ = Get string... i
	Read from file... 'directory$'/'gridname$'
endfor



# open all files and count the number of labels

for i to ns
	select Strings list
	gridname$ = Get string... i
	name$ = gridname$ - ".TextGrid"
	Read from file... 'directory$'/'gridname$'
	select TextGrid 'name$'
	
	number_of_word = Count labels... 1 'word$'
	sum=sum+number_of_word	
endfor

# writing out the result
fileappend "'textfile$'" 'sum''newline$'

# cleanup

select all
minus Strings list
Remove

