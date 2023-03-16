#!/bin/bash
env DISPLAY=:0
mpv --force-window=no /home/diver/Загрузки/Музыка/12/111.mp3 &
PID=$!
trap 'kill -9 ${PID}' SIGTERM SIGKILL EXIT
wait $PID
