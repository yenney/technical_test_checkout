import sys

def solution(boxes):
	
	print('Given Boxes: {0}'.format(boxes))

	box_set = set(boxes)
	total_duplicate_boxes = len(boxes) - len(box_set)
	print(total_duplicate_boxes)
	max_box_diff = 0
	longest_distance = 0

	for i in range(0,len(boxes)):
		for k in range(i+1,len(boxes)):
			print('i: {0} i: {1} {2}-{3}: {4} k-i: {5} Total: {6}'.format(i,k, boxes[i], boxes[k], boxes[k]-boxes[i], ((k-i)+1)-total_duplicate_boxes, abs(boxes[k]-boxes[i])+abs(k-i)))
			if max_box_diff < abs(boxes[k]-boxes[i])+abs(k-i):
				max_box_diff = abs(boxes[k]-boxes[i])+abs(k-i)
				longest_distance = ((k-i)+1)-total_duplicate_boxes

	print('There are a total of {0} boxes between each other!'.format(longest_distance))

boxes = [8, 6, 2, 5]
#boxes = [9, 7, 7, 10, 4, 8]
#boxes = [1, 2, 3, 4, 5, 6, 7]
#boxes = [8, 2, 3, 3, 16, 8, 9, 20]

solution(boxes)