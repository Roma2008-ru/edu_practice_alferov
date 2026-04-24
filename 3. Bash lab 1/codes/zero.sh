#!/bin/bash

GROUP="9СА-321"
NAME="Роман"
FAMILIA="Алферов"
STIPENDIYA="778.50"
DOLLAR="74.83"
STIPENDIYA_USD=$(echo "scale=2; $STIPENDIYA/$DOLLAR" | bc)

echo "Я учусь в $GROUP, зовут меня $NAME $FAMILIA."
echo "В этом месяце мне пришла стипендия размером в $STIPENDIYA рублей, это $STIPENDIYA_USD долларов."








