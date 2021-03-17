#!/bin/bash

echo -e "\e[93m********** navigate to home directory **********\e[0m"
cd ~

echo -e "\e[93m********** apt update **********\e[0m"
sudo apt update

echo -e "\e[92m ---------------------------------------------------------\e[0m"
echo -e "\e[92m load terminal configuration \e[0m"
echo -e "\e[92m ---------------------------------------------------------\e[0m"
# .dconf file is generated via: dconf dump /org/gnome/terminal/legacy/profiles:/ > alex-terminal-profile.dconf

wget https://raw.githubusercontent.com/azeljkovic/my_shell_and_terminal_setup/main/alex-terminal-profile.dconf
dconf load /org/gnome/terminal/legacy/profiles:/ < alex-terminal-profile.dconf
rm alex-terminal-profile.dconf

echo -e "\e[92m ---------------------------------------------------------\e[0m"
echo -e "\e[92m tmux/zsh/ohmyzsh \e[0m"
echo -e "\e[92m ---------------------------------------------------------\e[0m"

echo -e "\e[93m********** installing tmux **********\e[0m"
sudo apt install tmux -y

echo -e "\e[93m********** installing zsh **********\e[0m"
sudo apt install zsh -y

echo -e "\e[93m********** installing ohmyzsh pre-reqisits **********\e[0m"
sudo apt install fonts-powerline -y
sudo apt-get install fzf -y

echo -e "\e[93m********** installing ohmyzsh **********\e[0m"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# before this step you need to exit ohmyzsh by typing exit
echo -e "\e[93m********** adding ohmyzsh configurataion **********\e[0m"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wget https://raw.githubusercontent.com/azeljkovic/my_shell_and_terminal_setup/main/.zshrc
