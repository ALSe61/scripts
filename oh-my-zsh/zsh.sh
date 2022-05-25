#!/bin/bash
echo "OhMyZSH install..."
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$ZSH/custom"
# bash -c "$(wget https://raw.githubusercontent.com/ALSe61/scripts/master/oh-my-zsh/zsh.sh -O -)"
[ -x "$(command -v apt)" ] && apt -qy install zsh 2>&1
[ -x "$(command -v opkg)" ] && opkg -qy install zsh 2>&1
[ -x "$(command -v pkg)" ] && pkg -qy install zsh 2>&1
echo "Copy plugins & settings..."
# Oh-my-zsh
[ ! -d "$ZSH" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
wget https://raw.githubusercontent.com/ALSe61/scripts/master/oh-my-zsh/.zshrc -O ~/.zshrc 2>&1
# sed -i 's/export ZSH=.*/export ZSH="\/data\/data\/com.termux\/files\/home\/.oh-my-zsh"/' ~/.zshrc
# powerlevel10k
[ ! -d $ZSH_CUSTUM/themes/powerlevel10k ] && \
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k 2>&1
wget https://raw.githubusercontent.com/ALSe61/scripts/master/oh-my-zsh/.p10k.zsh -O ~/.p10k.zsh 2>&1
# zsh-syntax-highlighting
[ ! -d ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting ] && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" 2>&1
# zsh-autosuggestions
[ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ] && \
git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" 2>&1
#chsh -s zsh
echo "Complete!"
exit 0
