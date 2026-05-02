#!/bin/bash
user="user"
if grep -q "^$user:" /etc/passwd; then
	echo "Пользователь $user существует"
elif "/home/$user"; then
	echo "Пользователь отсутствует, но каталог /home/user доступен"
else
	echo "Пользователь отсутствует и отсутствует католог /home/$user"
fi

