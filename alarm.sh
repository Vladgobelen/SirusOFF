#!/bin/bash
env DISPLAY=:0
mpv --force-window=no ~/Музыка/Скрипты/alarm.mp3 &
PID=$!
trap 'kill -9 ${PID}' SIGTERM SIGKILL EXIT
wait $PID



