#! /usr/bin/env python
import math

# Aftab Khan, 2014

""" Calculate the length of a vector represented by a list of numbers """
def length(a):
	return math.sqrt(sum([x**2 for x in a]))

""" Normalize a vector represented by a list of numbers (make the vector length
	equal to 1) """
def normalize(a):
	vlength = length(a)
	return [x/vlength for x in a]

""" Calculate the dot product of two vectors (the sum of the products of the
	corresponding bases of two vectors) represented by two lists of numbers """
def dot_product(a, b):
	return sum([x*y for (x,y) in zip(a,b)])

""" Print the values of the components of a vector represented by a list of 
	numbers to up to 6 digits of precision """
def print_vector(a):
	for x in a: print "%.6g" % x,
	print ""

def main():
	vectors = []
	# read in N vectors of various lengths
	for i in range(int(raw_input())):
		vectors.append(map(float, raw_input().split()))
		del vectors[i][0]
	# perform M vector operations on the vectors
	for j in range(int(raw_input())):
		input_line = raw_input().split()
		vector_function = input_line.pop(0)
		if vector_function == "n":
			print_vector(normalize(vectors[int(input_line[0])]))
		elif vector_function == "l":
			print "%0.6g" % length(vectors[int(input_line[0])])
		elif vector_function == "d":
			print "%0.6g" % dot_product(vectors[int(input_line[0])], vectors[int(input_line[1])])

if __name__ == "__main__": main()