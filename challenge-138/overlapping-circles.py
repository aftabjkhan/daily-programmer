#! /usr/bin/env python

import math

circle_radius = 1

inputted_coords = raw_input().split()

def distance(x1, y1, x2, y2):
	#return math.sqrt(math.pow((x1-x2), 2) + math.pow((y1-y2), 2))
	#return math.sqrt(((float(x1)-float(x2)) ** 2) + ((float(y1)-float(y2)) ** 2))
	#return math.sqrt(((x1-x2) ** 2) + ((y1-y2) ** 2))
	return (((x1 - x2) ** 2) + ((y1 - y2) ** 2)) ** 0.5

# def segment_area():
