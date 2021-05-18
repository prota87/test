#!/bin/bash  

# Скачивание пакетов
sudo wget https://cloud.ksamu.ru/index.php/s/wRpzarn8bZqo56Z/download

# распаковка=>переход в директорию 
sudo unzip download
cd distrib_ksamu_astra_1.6_update

#
sudo /usr/bin/dpkg -i libc6-i386_2.24-11+deb9u3_amd64.deb
sudo /usr/bin/dpkg -i libccid_1.4.26-1_amd64.deb
sudo /usr/bin/dpkg -i libgost-astra_0.0.19_amd64.deb
sudo /usr/bin/dpkg -i lib32gcc1_6.3.0-18+deb9u1_amd64.deb
sudo /usr/bin/dpkg -i lib32stdc++6_6.3.0-18+deb9u1_amd64.deb
sudo /usr/bin/dpkg -i lib32tinfo5_6.0+20161126-1+deb9u2_amd64.deb
sudo /usr/bin/dpkg -i lib32ncurses5_6.0+20161126-1+deb9u2_amd64.deb
sudo /usr/bin/dpkg -i ia32-libs_20180423.2_amd64.deb
sudo /usr/bin/dpkg -i wine-ksamu-astra_5.0_amd64.deb
sudo /usr/bin/apt-get remove fonts-wine-tahoma -y
#export PATH=$PATH:/opt/wine-ksamu/bin
#WINEARCH=win32 WINEPREFIX=~/.wine wine wineboot

# Распаковываем директорию .wine с программой KSAMU
tar -C $HOME -xvf wine.tar.gz
#tar -C $HOME -xvf wine.tar.gz

# Создаем ярлык на рабочем столе
sudo /bin/echo -e "[Desktop Entry]\nName=ksamu\nName[ru]=КСАМУ\nType=Application\nNoDisplay=false\nExec=/opt/wine-ksamu/bin/wine $HOME/.wine/drive_c/ksamu/KSAMU.exe\nIcon=$HOME/.wine/drive_c/ksamu/KSAMU_Icon.png\r\nHiden=false\nTerminal=false\nStartupNotify=false"> $HOME/Desktop/ksamu.desktop;

# Удаляем файлы шрифтов Tahoma (где найдем)

sudo find /usr -name "tahoma.ttf" -delete
sudo find /usr -name "tahomabd.ttf" -delete

sudo find /opt -name "tahoma.ttf" -delete
sudo find /opt -name "tahomabd.ttf" -delete

sudo mkdir -p /usr/share/fonts/ttf/ms
sudo cp -f -t /usr/share/fonts/ttf/ms tahoma*.ttf
    
# Обновляем кэш шрифтов
fc-cache -fv