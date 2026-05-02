#!/bin/bash
uesr="user"
if grep -q "^$user:" /etc/passwd;then
	echo "Пользователь существует"
else
	echo "Пользователь не найден"
fi

