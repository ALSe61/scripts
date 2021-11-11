#!/bin/sh

P="mc"
if [ "$(dpkg-query -W -f="${Status}" "$P" 2>/dev/null | grep -c "ok installed")" -eq 0 ]; then
  sudo apt-get install -y "$P"
fi
git clone https://github.com/ALSe61/scripts.git /tmp/scripts
cp -f /tmp/scripts/mc/ini ~/.config/mc/ini
if [ ! -e ~/.local/share/mc/skins ]; then
    mkdir ~/.local/share/mc/skins
fi
cp -f /tmp/scripts/mc/skins/* ~/.local/share/mc/skins/
rm -fr /tmp/scripts
exit 0