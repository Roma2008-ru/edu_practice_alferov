#!/bin/bash

if [ -f "$1" ]; then
	echo "Файл $1 существует"
else
	echo "Файл $1 не найден"
fi



