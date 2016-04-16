#!/usr/bin/python

from fractions import gcd


baud_rate = 9600
global_clock_freq = 50e6 

baud_freq = 16*baud_rate / gcd(global_clock_freq, 16*baud_rate)
baud_limit = (global_clock_freq / gcd(global_clock_freq, 16*baud_rate)) - baud_freq

print "For a Global Clock of {0}MHz, and a baud of {1}".format(global_clock_freq/1e6,baud_rate)
print "baud_freq: {0:X}".format(int(baud_freq))
print "baud_limit: {0:X}".format(int(baud_limit))

