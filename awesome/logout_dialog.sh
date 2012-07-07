#!/bin/sh

# Stolen from http://awesome.naquadah.org/wiki/ShutdownDialog with minor edits.

ACTION=`zenity --width=128 --height=256 --list --radiolist --text="Select logout action" --title="Logout" --column "Choice" --column "Action" TRUE LockScreen FALSE Shutdown FALSE Reboot FALSE Suspend`

if [ -n "${ACTION}" ];then
  case $ACTION in
  Shutdown)
    zenity --question --text "Shutdown?" && dbus-send --system --print-reply --dest=org.freedesktop.ConsoleKit \
    /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop
    ;;
  Reboot)
    zenity --question --text "Reboot?" && dbus-send --system --print-reply --dest=org.freedesktop.ConsoleKit \
    /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart
    ;;
  Suspend)
    dbus-send --print-reply --system --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend
    ;;
  LockScreen)
    slock
    ;;
  esac
fi
