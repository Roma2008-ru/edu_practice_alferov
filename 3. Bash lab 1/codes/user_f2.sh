#!/bin/bash

if grep -q "^$1" /etc/passwd; then
        echo "Ура! Пользователь $1 найден."
else
        echo "Пользователь $1 не найден."
	touch "dont_be_sad_user_$1_will_be_there_soon.txt"
fi




