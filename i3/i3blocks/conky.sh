#!/bin/bash
conky=$(pgrep conky) 
if [[ $conky != "" ]]; then
       	echo -e " RUNNING\n\n"
else
	echo -e " STOPPED\n\n#d64937"
fi
