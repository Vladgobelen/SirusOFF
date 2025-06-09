#!/bin/sh
cd "/home/diver/Скрипты/off//home/diver/Скрипты/off/"
j=$(date)
git add .
git commit -m "$1 $j"
git push git@github.com:Vladgobelen/SirusOFF.git


