#!/bin/bash

if grep -q "^$1" /etc/passwd; then
        echo "Ура! Пользователь $1 найден."
else
        echo "Пользователь $1 не найден."
fi







