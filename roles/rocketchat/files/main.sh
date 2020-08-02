#!/bin/bash
for i in `seq 1 30`;
do
	node main.js && s=$$? && break || s=$$?; 
	echo "Tried $$i times. Waiting 5 secs..."; 
	sleep 5; 
done;
echo "tried 30x times, exiting...."
exit 0
