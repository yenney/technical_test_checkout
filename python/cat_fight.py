import sys

def solution(boxes):
	
	output = [0] * len(boxes)
	for i, x in enumerate(sorted(range(len(boxes)), key=lambda y: boxes[y])):
	    output[x] = i

	print('Given Boxes: {0}'.format(boxes))

	print('There are a total of {0} boxes between each other!'.format(output[0]))



#boxes = [8, 6, 2, 5]
boxes = [9, 7, 7, 10, 4, 8]


solution(boxes)