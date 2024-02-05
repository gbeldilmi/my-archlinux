#!/usr/bin/env bash

function _run() {
  #wg-quick down wg0
  ip route add 10.42.0.0/16 via aquarius
}

if [ "$EUID" -ne 0 ]
then
  echo "Please run as root"
  exit 1
else
  _run
  exit 0
fi
