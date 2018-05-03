#!/usr/bin/env python

import itertools

square = [ 1, 2, 3, 4, 5, 6 ]
# output
tableCount = 0
rowCount = 0
p =  list(itertools.permutations(square,6))
square = []
with open("n6.txt", 'r') as infile:
    lines = [line for line in infile]
pidx = 0
nidx = 0
i = 0
while(i<15228):
  seven = []
  for i in range(0+nidx,6+nidx):
    temp = []
    #print "i=" + str(i) + " line:" + str(lines[i])
    for e in lines[i]:
	if(e.strip()):
	    temp.append(p[pidx][(int(e)-1)])
    found = False
    #print "rows " + str(len(square))
    for sev in square:
	if(temp in sev):
 	    #print "skip"
            found = True
	    break
    if(found):
        nidx = nidx + 6
	continue	
    else:
    	seven.append(temp)
  checksum = 0
  for s in seven:
    checksum = checksum + s[0]
  if(checksum==21):      
    square.append(seven)
  pidx = pidx + 1
  nidx = nidx + 6
for squ in square:
  for sq in squ:
    print " ".join(str(s) for s in sq) 
