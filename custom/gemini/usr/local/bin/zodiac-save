#!/usr/bin/env bash

function _run() {
  _date=$(date +%F)
  sha256deep -r /zodiac/home/library | tee /zodiac/save/home-library-save-$_date.sha256
  tar -I pixz -cvf /zodiac/save/home-library-save-$_date.tar.xz  /zodiac/home/library
  sha256deep -r /zodiac/home/workspace | tee /zodiac/save/home-workspace-save-$_date.sha256
  tar -I pixz -cvf /zodiac/save/home-workspace-save-$_date.tar.xz  /zodiac/home/workspace
}

nohup _run &!

