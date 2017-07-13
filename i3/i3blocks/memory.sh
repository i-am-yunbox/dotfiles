#!/bin/bash
echo -e " $(free -h | \grep Mem | awk '{print $3}')\n\n"  
