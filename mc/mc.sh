#!/bin/sh

P="mc"


if [ "$(dpkg-query -W -f="${Status}" "$P" 2>/dev/null | grep -c "ok installed")" -eq 0 ];
then
  apt-get install nano;
fi
git clone 