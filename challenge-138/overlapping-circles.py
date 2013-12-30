#! /usr/bin/env python

import math

circle_radius = 1

""" Read console input (Python 2.7), split string over whitespace, and
	convert to float """
coords = map(float, raw_input().split())

""" Calculate distance between two points given the points' coordinates """
def distance(x1, y1, x2, y2):
	return math.sqrt(((x1-x2) ** 2) + ((y1-y2) ** 2))

""" Calculate interior angle formed by the radii of the circle and the
	two boundary points of the intersecting region of the two circles 
		d - the distance between the two circles 
		r - the radius of the circle """
def theta(d, r):
	return 2 * math.acos(d / (2 * r))

""" Calculate circular segment area of the circle 
		theta - the interior angle of the circle 
		r - the radius of the circle """
def segment_area(theta, r):
	return 0.5 * (theta - math.sin(theta)) * (r ** 2)

theta = theta(distance(coords[0], coords[1], coords[2], coords[3]), circle_radius)
# Answer is the area of two circles (2*pi*(r**2)) minus the intersecting area (2*seg_area)
print "%.4f" % ((2 * math.pi) - (2 * segment_area(theta, circle_radius)))
