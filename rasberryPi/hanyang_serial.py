#!/usr/bin/python
import serial

class HanyangSerial():
    def __init__(self):
        baud = 115200
        self.recv_buffer=[]
        self.ACK=0x5A #ACK byte
        self.ser = serial.Serial('/dev/ttyS0',baudrate=baud,stopbits=serial.STOPBITS_TWO)
        self.ser.close()
        self.ser.open()

    def raw_write(self):
        '''Debug'''

	print("Writing this to serial:")
	self.ser.write(raw_input().strip()+'\n')
	print("\nWhat bounced back:")
	chars_buffered = self.ser.inWaiting()
	print("Have {0} chars waiting".format(chars_buffered))
	chars_read = self.ser.read(chars_buffered)
	for char in (chars_read):
		print ord(char)

    def writeCmd(self,address,data,length=1,ack=True):
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

    def readCmd(self,address,length=1,ack=True):
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

    def sendFrame(self,frame,data=[]):
    '''Sends Binary data frame as parsed by readCmd|writeCmd'''
        for byte in frame:
            self.ser.write(byte)
        for byte in data:
            self.ser.write(byte)
        self.ser.flush()

    def recvFrame(self,length,ack=True):
    '''Return frame data from FPGA'''

        if True:
            return self.ser.readall()

        self.recv_buffer = self.ser.readall()
        if (ack == True):
            if self.ACK in recv_tmp:
                pass

if __name__ == "__main__":
	print "Starting script"
	
