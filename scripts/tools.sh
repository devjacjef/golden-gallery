#!/bin/bash

# By using the pi's MAC address, if the IP changes then the device can still be found.
conn-pi() {
	ssh pi@$(arp -a | grep 'b8:27:eb:e5:34:e6' | awk '{print $2}' | tr -d '()')
}

# By using a similar approach from before, I can now send something to the pi at a specific path.
send-pi() {
	scp -r $1 pi@$(arp -a | grep 'b8:27:eb:e5:34:e6' | awk '{print $2}' | tr -d '()'):$2
}

# An alias to cross compile for the pi
cross() {
	make KERNEL=/home/cmp408/rpisrc/linux CROSS=/home/cmp408/tools/arm-bcm2708/arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
}

# An alias to cross compile and send to a place on the pi
cross-send() {
	cross
	send-pi $1 $2
}

gg() {
	cross
	send-pi ggkm.ko ./Downloads
	echo "Should have sent!"
}
