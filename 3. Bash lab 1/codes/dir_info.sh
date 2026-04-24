#!/bin/bash

SIZE=$(du -sk "${1:-.}" | awk '{print $1}')
echo "Общий размер: $SIZE KB"


