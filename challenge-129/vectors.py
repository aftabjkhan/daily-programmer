#! /usr/bin/env python
import math

# Aftab Khan, 2014

""" Calculate the length of a vector """
def length(a):
	return math.sqrt(sum([x**2 for x in a]))

""" Normalize a vector (make the length equal to 1)"""
def normalize(a):
	vlength = length(a)
	return [x/vlength for x in a]

""" Calculate the dot product of two vectors (the sum of the products of the
	corresponding bases of two vectors) """
def dot_product(a, b):
	return sum([x*y for (x,y) in zip(a,b)])
