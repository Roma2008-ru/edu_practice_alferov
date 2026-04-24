#!/bin/bash

if [ -z "$1" ]; then
	echo "Отсутствует имя. Используйте: ./start.sh [имя]"
	exit 1
else
	echo "Привет, $1!"
fi



