#!/bin/bash
val1=6
val2=10
if [ $val1 -gt $val2 ]; then
	echo "$val1 больше $val2"
elif [ $val1 -lt $val2 ]; then
	echo "$val1 меньше $val2"
else
	echo "Числа равны"
fi

