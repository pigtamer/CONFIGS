# UBUNTU

1. Mozc日文输入法
    在设置中增加一个键位，如在Direct Input下，按Shift+Space切换到平假

2. Dash to Dock 和Ubunutu Dock的冲突
    直接用apt卸载Ubuntu Dock
    sudo apt purge gnome-shell-extension-ubuntu-dock

3. sudo 不能运行GUI程序
    Wayland的通病
    xhost +local:
    可以设置alias:
    guisudo='xhost +local: && sudo'

4. opencv安装中，CMAKE报错称Qt找不到
    手动
    sudo apt install qt5-default

5. python 环境的一些小问题
    sudo apt install python3-pip
    sudo pip3 install opencv-python

6. 链接到Widnows 的NTFS 文件夹
    sudo ln -s <DESTINATION> <LINK SHORTCUT LOACTION>
    这里说明一下，需要在disk 设置中将Windows的盘设为开机自动挂载，载入位置自选
    这些文件是只读的，似乎和Windows有关，待解决

7. Windows 和 Linux 时间同步
    timedatectl set-local-rtc 1 --adjust-system-clock


8. expressvpn dns
    Activation Code: ETKWPR5THUDZP3UWQCJRRDK

    New Code: ED13E9DXJH5PEAZGDXULUUU

    sudo vim /etc/NetworkManager/NetworkManager.conf
    并加入两行语句：
    [main]
    dns=dnsmasq
    重启网络管理服务
    sudo systemctl restart NetworkManager
    expressvpn 的最新CLI貌似解决了这个issue，做出上述改动反造成解析问题

    **once again.**

    4.2.2.2
    4.2.2.1
    去掉dnsmasq

    [最佳组合拳]    
    ```bash
    sudo systemd-resolve --flush-caches
    
    sudo rm -f /etc/resolv.conf
    
    sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
    
    sudo systemctl restart systemd-resolved.service
    ```
    || UPDATE __ Sep 1, 2018 ||

    You are on the right track. the resolv.conf was changed for VPN use and was not changed back for normal use as a result of the crash. Deleting the old resolv.conf may help. You can make a backup copy of the file and delete the original with this single command:

    ```bash
    
    sudo mv /etc/resolv.conf /etc/backup.resolv.conf
    
    ```

    A new resolv.conf will be generated as and when needed. See the answer to the following question:

    Can not access Internet (DNS names do not resolve) after update today

    Also see:

    http://www.stgraber.org/2012/02/24/dns-in-ubuntu-12-04/

    Hope this helps.

    down vote

    @user68186's answer didn't quite work for me, though that might have been due to other issues. What did seem to work is doing what was suggested (removing /etc/resolv.conf by creating a backup)

    sudo mv /etc/resolv.conf /etc/backup.resolv.conf

    and then (following resolveconf's good man page) creating a new sym link to 		`/run/resolvconf/resolv.conf` (which I found mentioned also in this Ubuntu 14.04 resolvconf bug report)

    `cd /etc`
    `sudo ln -s /run/resolvconf/resolv.conf .`

    After doing this and restarting the network-manager

    `sudo /etc/init.d/network-manager restart`

    things seem to be working again.

    即：

    ```bash
    sudo mv /etc/resolv.conf /etc/backup.resolv.conf
    
    sudo /etc/init.d/network-manager restart
    ```

    [如果实在不行就疯狂组合拳]

9. vyprvpn service
    需要 sudo apt --fix-broken install
    要在其他代理在工作的情况下激活服务
    并:
    Command to open the file:
        sudo vim /etc/systemd/system/vyprvpn.service

    Change the line with the following:
        ExecStop=killall vyprvpn_service

    TO
        ExecStop=/usr/bin/killall vyprvpn_service

    Then stop the service with:
        systemctl stop vyprvpn.service
    and then start the service with:
        systemctl start vyprvpn.service

10. 突然出现的网络连接消失
      未知原因，重配置VPN之后出现（Express, 不建议）
      sudo service NetworkManager stop
      sudo rm /var/lib/NetworkManager/NetworkManager.state #or backup
      sudo service NetworkManager start

# WINDOWS

1. LaTeX minted 出现 ^^I (On XeLaTeX compiler):

    add "-8bit -shell-escape" to xelatex compiler toolchain. 8-bit options makes all characters printable.

2. vs code win64 config file is commited to your git catalog.
    Caution: path var ${OPENCV_HEADERS} = "H:\opencv\build\include".


# PYTHON
1. matlab with jupyter:
    pip install matlab_kernel

2. matlab engine for python: (https://www.mathworks.com/help/matlab/matlab-engine-for-python.html?s_tid=gn_loc_drop)
    On Windows systems
        cd "matlabroot\extern\engines\python"
        python setup.py install

    On Mac or Linux systems —
        cd "matlabroot/extern/engines/python"
        python setup.py install

# Dlib

## win64, msvc15
1. 请设定 OPENCV_INLCUDE_DIRS ，值为 opencv 头文件路径
2. cmake 注意 x64 ：
``` bash
cd <DLIB_ROOT_DIR>
mkdir build && cd build
cmake .. -G "Visual Studio 15 2017 Win64" -T host=x64
cmake --build . --config Release --target install
```
3. 如果 install 遇到无法写入，用管理员权限运行Native CLI.

# Xgboost
Cmake 命令行编译：
``` bash
git clone --recursive https://github.com/dmlc/xgboost
cd <CLONED_XGBOOST_DIR>
# ON WINDOWS:
git submodule init
git submodule update
###
mkdir build && cd build
cmake .. -G"Visual Studio 15 2017 Win64" -T host=x64
cmake --build . --target xgboost --config Release
```
对于 Python：
``` bash
cd <CLONED_XGBOOST_DIR>
cd python-package; sudo python setup.py install
```
