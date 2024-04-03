#!/usr/bin/env bash

lFan="$(`pwd`/TheOneWidget.widget/fan-bar.widget/osx-cpu-temp -f)"
cpuTemp="$(`pwd`/TheOneWidget.widget/fan-bar.widget/osx-cpu-temp -C)"
echo $lFan 
echo " "$cpuTemp
