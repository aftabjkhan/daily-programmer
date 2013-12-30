#! /usr/bin/env python
from __future__ import print_function
from math import pi, acos, sin

# Aftab Khan, 2013

# Assuming circle radius = 1

# SINGLE LINE SOLUTION:
map(lambda d: print("%.4f"%(((2*pi)-(2*acos(d/2)-sin(2*acos(d/2))))
	if(d<2)else(2*pi))), map(lambda c:((((c[0]-c[2])**2)+((c[1]-c[3])**2))**0.5),
		[map(float, raw_input().split())]))