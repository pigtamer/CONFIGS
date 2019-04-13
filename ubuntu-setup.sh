# cy99@xc++CTU
# update catalogue
sudo apt update
sudo apt upgrade

# themes and shell extensions
sudo apt install gnome-tweak-tool chrome-gnome-shell
sudo apt purge gnome-shell-extension-ubuntu-dock

# dev tools
sudo apt install git cmake vim axel
 
# python env
sudo apt install ipython3 python3-pip
sudo pip3 install numpy scipy scikit-learn pandas matplotlib seaborn opencv-python xgboost keras tensorflow jupyter jupyterlab pylint 

# LaTeX and Markdown
sudo apt install texlive-full texstudio
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb https://typora.io ./linux/'
sudo apt update && sudo apt install typora

# qt
sudo apt install qt5-default

# media player
sudo apt install gnome-mpv

# opencv
sudo bash ./OPENCV_INSTALL.sh

# some configs
git config --global user.email cygee99@gmail.com
git config --global user.name pigtamer

