#!/bin/ash
echo "OhMyZSH install..."
sleep 5
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
else
  echo "OhMyZSH alredy install..."
fi
echo "Copy plugins & settings..."
sleep 5
# powerlevel10k
[ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
# zsh-syntax-highlighting
[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions
[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 
# zshrc settings
[ ! -f  ~/.zshrc ] && wget https://raw.githubusercontent.com/ALSe61/scripts/master/oh-my-zsh/.zshrc -O ~/.zshrc
# powerlevel10k settings
[ ! -f  ~/.p10k.zsh ] && wget https://raw.githubusercontent.com/ALSe61/scripts/master/oh-my-zsh/.p10k.zsh -O ~/.p10k.zsh

#sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
#sed -i 's/plugins=.*/plugins=(git\ zsh-syntax-highlighting\ sudo\ docker\ docker-compose\ systemadmin\ systemd\ zsh-autosuggestions)/' ~/.zshrc
