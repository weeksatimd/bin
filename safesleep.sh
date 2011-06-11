#!/bin/sh

SETTING=$1

if [ "$SETTING" == "off" ]; then
  echo "Turning off safe sleep"
  sudo pmset -a hibernatemode 0
  sudo nvram "use-nvramrc?"=false
  echo "Don't forget to reboot!"
  echo You are now free to remove your sleepimage file at /private/var/vm/sleepimage
elif [ "$SETTING" == "on" ]; then
  echo "Turning on safe sleep"
  sudo pmset -a hibernatemode 3
  sudo nvram "use-nvramrc?"=true
  echo "Don't forget to reboot!"
else
  echo "Usage: safesleep on | off"
fi