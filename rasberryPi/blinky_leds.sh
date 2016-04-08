#!/bin/bash
gpio mode 0 out
gpio mode 1 out

while(true)
do
	gpio write 1 1
	gpio write 0 0
	sleep 1 #1 second
	gpio write 1 0
	gpio write 0 1
	sleep 1 #1 second
done
