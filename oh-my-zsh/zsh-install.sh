#!/bin/ash

[ -x "$(command -v apt)" ] && PM="apt"
[ -x "$(command -v opkg)" ] && PM="opkg"
[ -x "$(command -v pkg)" ] && PM="pkg"
echo "OhMyZSH install..."
sleep 5
[ ! -x "$(command -v zsh)" ] && $PM update && $PM install zsh -y
[ ! -x "$(command -v git)" ] && $PM update && $PM install git -y
[ ! -x "$(command -v wget)" ] && $PM update && $PM install wget -y
echo "Copy plugins & settings..."
sleep 5
# Oh-my-zsh
[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget https://raw.githubusercontent.com/ALSe61/scripts/master/oh-my-zsh/.zshrc -O ~/.zshrc
[ "$PM" = "pkg" ] && sed -i 's/export ZSH=.*/export ZSH="\/data\/data\/com.termux\/files\/home\/.oh-my-zsh"/' ~/.zshrc
# powerlevel10k
[ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k 
wget https://raw.githubusercontent.com/ALSe61/scripts/master/oh-my-zsh/.p10k.zsh -O ~/.p10k.zsh
# zsh-syntax-highlighting
[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions
[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] && \
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 
echo "Complete!"
sleep 5 && exit 0
