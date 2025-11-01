sudo ln -s $HOME/dotfiles/kmonad/keyboard.service /etc/systemd/system/
sudo systemctl start keyboard.service
sudo systemctl enable keyboard.service
mkdir $HOME/github
cd $HOME/github
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
chsh -s $(which zsh)
