#!/usr/bin/env python

import copy

with open("reduced6.ls") as fileobj:
    for line in fileobj:  
       linep = []
       count = 0
       square = []
       #reversedSquare = []
       for ch in line:
	    if(ch=='\n'):
		#print square
   		#square.extend(reversedSquare)
		#print square
		for l in square:
		    print " ".join(str(e) for e in l)
       		square = []
       		#reversedSquare = []
		continue
            linep.append(int(ch)+1)
  	    count = count + 1
       	    if(count == 6):
	        #print linep
	    	square.append(linep)
		#reversedLine = copy.copy(linep)
     		#reversedLine.reverse()
     		#reversedSquare.append(reversedLine)
		#print reversedSquare
		linep = []
		count = 0
