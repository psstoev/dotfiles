#!/bin/sh

# Stolen from http://awesome.naquadah.org/wiki/ShutdownDialog with minor edits.

ACTION=`zenity --width=128 --height=256 --list --radiolist \
       --text="Select logout action" --title="Logout" \
       --column "Choice" --column "Action" \
       TRUE LockScreen \
       FALSE Shutdown \
       FALSE Reboot \
       FALSE Suspend \
       FALSE Hibernate`

if [ -n "${ACTION}" ];then
  case $ACTION in
  Shutdown)
    dbus-send --system --print-reply \
    --dest=org.freedesktop.ConsoleKit \
    /org/freedesktop/ConsoleKit/Manager \
    org.freedesktop.ConsoleKit.Manager.Stop
    ;;
  Reboot)
    dbus-send --system --print-reply \
      --dest=org.freedesktop.ConsoleKit \
      /org/freedesktop/ConsoleKit/Manager \
      org.freedesktop.ConsoleKit.Manager.Restart
    ;;
  Suspend)
    dbus-send --system --print-reply \
    --dest=org.freedesktop.UPower \
    /org/freedesktop/UPower \
    org.freedesktop.UPower.Suspend
    ;;
  Hibernate)
    dbus-send --system --print-reply \
    --dest=org.freedesktop.UPower \
    /org/freedesktop/UPower \
    org.freedesktop.UPower.Hibernate
    ;;
  LockScreen)
    slock
    ;;
  esac
fi
