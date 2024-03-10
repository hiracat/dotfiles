#!/bin/sh

swayidle -w timeout 300 'swaylock --daemonize' timeout 360 'sleep 2 && hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' &
