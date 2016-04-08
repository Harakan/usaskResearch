#!/usr/bin/python
import serial

baud = 115200
ser = serial.Serial('/dev/ttyS0',baud)
ser.close()
ser.open()

while(1):
	print("Writng a ting to serial")
	ser.write(raw_input()+"\n")
	print("What bounced back:")
	print(ser.readline())
