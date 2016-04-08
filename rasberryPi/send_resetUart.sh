#!/bin/bash

gpio mode 0 out
gpio mode 1 out

echo "Setting RESET for 1 second"
gpio write 0 1
sleep 1 #1 second
gpio write 0 0
echo "UART has been reset"
