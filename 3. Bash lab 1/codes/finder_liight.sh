#!/bin/bash

if [ -L "$1" ]; then
	echo "Это символическая ссылка."
elif [ -f "$1" ]; then
        echo "Это обычный файл"
elif [ -d "$1" ]; then
        echo "Это директория."
else
        echo "Что-то другое или не существует."
fi


