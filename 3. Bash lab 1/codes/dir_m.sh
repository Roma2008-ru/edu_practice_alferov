#!/bin/bash

if [ -d "$1" ]; then
	echo "Директория $1 уже существует"
else
	mkdir "$1"
	echo "Директория $1 создана"
fi



