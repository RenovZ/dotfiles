#!/usr/bin/env bash

IP="$(curl -4fNs https://api.ipify.org/?format=text)"
# COUNTRY="$(curl -4fNs https://ipapi.co/$IP/json/)"
ICON=""
# if [ -n "$COUNTRY" ]; then
#   ICON="http://www.geognos.com/api/en/countries/flag/$COUNTRY.png"
# fi
echo $IP $ICON
