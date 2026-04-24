#!/bin/bash

if grep -q "^$USER" /etc/passwd; then
	echo "Ура! Пользователь $USER найден."
else
	echo "Пользователь $USER не найден."
fi



