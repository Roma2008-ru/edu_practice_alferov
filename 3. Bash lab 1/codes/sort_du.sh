#!/bin/bash

find "${1:-.}" -maxdepth 1 -type f -printf '%T@ %p\n' | sort -n | head -3 | while read time name; do
	echo "$name - $(stat -c '%y' "$name" | cut -d'.' -f1)"
done



