#!/bin/ash
echo "OhMyZSH install..."
if [ ! -d $HOME/.oh-my-zsh ]; then
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 
#sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
#sed -i 's/plugins=.*/plugins=(git\ zsh-syntax-highlighting\ sudo\ docker\ docker-compose\ systemadmin\ systemd\ zsh-autosuggestions)/' ~/.zshrc
wget https://github.com/ALSe61/scripts/raw/master/oh-my-zsh/.zshrc -O ~/.zshrc
wget https://github.com/ALSe61/scripts/raw/master/oh-my-zsh/.p10k.zsh -O ~/.p10k.zsh
else
echo "OhMyZSH alredy install..."