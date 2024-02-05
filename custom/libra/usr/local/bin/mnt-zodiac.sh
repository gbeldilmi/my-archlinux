#!/usr/bin/env bash

function _run() {
  mount.nfs gemini:/srv/zodiac /zodiac
}

if [ "$EUID" -ne 0 ]
then
  echo "Please run as root"
  exit 1
else
  _run
  exit 0
fi
