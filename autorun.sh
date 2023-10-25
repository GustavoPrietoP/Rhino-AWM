#!/bin/sh
# See https://wiki.archlinux.org/title/Awesome#Autostart

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

exec picom --experimental-backends &
