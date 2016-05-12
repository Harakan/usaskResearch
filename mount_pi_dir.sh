#!/bin/bash
#This mounts the raspberry pi's directory as a local directory
#
# The idea here is all bit get put here, moved to the pi's sd card (automagicly)
# - Then ssh into the pi and program it the fpga (or run the remote_program script)
sshfs pi@192.168.0.102:/home/pi/Research/usaskResearch/fpga_files pi_mount/
