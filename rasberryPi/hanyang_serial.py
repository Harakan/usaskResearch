#!/usr/bin/python
import serial

baud = 115200
ser = serial.Serial('/dev/ttyS0',baudrate=baud,stopbits=serial.STOPBITS_TWO)
ser.close()
ser.open()

def raw_write():
	print("Writing this to serial:")
	ser.write(raw_input().strip()+'\n')
	print("\nWhat bounced back:")
	chars_buffered = ser.inWaiting()
	print("Have {0} chars waiting".format(chars_buffered))
	chars_read = ser.read(chars_buffered)
	for char in (chars_read):
		print ord(char)

def writeCmd(address,data,length=1,ack=False):
''' Write to register(s) defined at address+length (inclusive)
		Length of 1 is single register, max value is 255 (value of 0 means length=256)'''

	if length == 0:
		assert len(data)==256
	else:
		assert len(data)==length

	if length != 1:
		auto_increment = True
	else:
		auto_increment = False
	write_cmd = 0b00100000
	write_cmd |= auto_increment<1
	write_cmd |= ack
	frame=[0,write_cmd,addr_high,addr_low,length]

def readCmd(address,length=1,ack=False):
''' Read register(s) defined at address+length (inclusive)
		Length of 1 is single register, max value is 255 (value of 0 means length=256)'''
	if length != 1:
		auto_increment = True
	else:
		auto_increment = False
	read_cmd = 0b00010000
	write_cmd |= auto_increment<1
	write_cmd |= ack
	addr_high=(address>>8)&0xFF
	addr_low=(address&0xFF)
	frame=[0,read_cmd,addr_high,addr_low,length]

def sendFrame(frame,data=[]):
	'''Sends Binary data frame as parsed by readCmd|writeCmd'''
	pass


if __name__ == "__main__":
	print "Starting script"
	
