#!/bin/bash
echo "Введите имя файла"
read file
chmod +x "$file"
if [ -x "$file" ]; then
	echo "Файл $file стал исполняемым"
else
	echo "Не получилось сделать файл исполняемым"
fi

