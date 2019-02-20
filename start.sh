#/bin/bash
startuppath='/home/pi/data'
syncthingrelease="v1.0.1-rc.2"
syncthingaddress="https://github.com/syncthing/syncthing/releases/download/"
syncthingversion="syncthing-linux-arm"
source="https://mirrors.tuna.tsinghua.edu.cn"


echo -e "########edit resource 更改镜像源#############"
sudo echo -e "deb ${source}/raspbian/raspbian/ stretch main contrib non-free rpi \n deb-src ${source}/raspbian/raspbian/ stretch main contrib non-free rpi" > /etc/apt/sources.list
sudo echo -e "deb ${source}/raspberrypi/ stretch main ui \n deb-src ${source}/raspberrypi/ stretch main ui" > /etc/apt/sources.list.d/raspi.list

echo -e "########update 更新系统#############"
sudo apt update && sudo apt -y upgrade

echo -e "########install pinyin 安装拼音输入法#############"
sudo apt-get install -y fcitx fcitx-googlepinyin fcitx-module-cloudpinyin fcitx-sunpinyin

echo -e "########install xrdp 安装远程桌面#############"
sudo apt-get install -y xrdp
echo -e "########install xrdp 安装screen#############"
sudo apt-get install -y screen

echo -e "########starting intall syncthing 开始安装syncthing#############"
echo -e "###download syncthing 下载syncthing####"
syncthinglink="${syncthingaddress}${syncthingrelease}/${syncthingversion}-${syncthingrelease}.tar.gz"
wget ${syncthinglink}
echo -e "###unzip syncthing 解压syncthing####"
tar -zxvf ${syncthingversion}-${syncthingrelease}.tar.gz
echo -e "####change floder name 更改文件夹名称 便于设置服务#####"
mv ${syncthingversion}-${syncthingrelease} syncthing
echo -e "####增加执行权限####"
cd syncthing
sudo chmod +x syncthing
echo -e "####以服务的方式后台运行####"
sudo cp ${startuppath}/syncthing /etc/init.d/
sudo chmod +x /etc/init.d/syncthing
echo -e "####开机自动启动####"
sudo update-rc.d syncthing defaults
echo -e "####install ARIA2 安装下载器(服务版)####"
sudo apt install -y aria2
echo -e "####建立配置文件####"
sudo mkdir -p /etc/aria2 
sudo cp ${startuppath}/aria2.conf /etc/aria2/
echo -e "####新建session，用于断点续传####"
sudo touch /etc/aria2/aria2.session
echo -e "####设置开机启动####"
sudo cp ${startuppath}/aria2c /etc/init.d/
sudo chmod +x /etc/init.d/aria2c
apt-get -y install chkconfig
chkconfig --add aria2c
echo -e "####安装webUI（需用IP/docs 访问）####"
apt-get -y install nginx
sudo rm -rf /var/www/html
sudo git clone https://github.com/ziahamza/webui-aria2.git /var/www/html


echo -e "####安装phddns花生壳动态解析客户端####"
wget http://download.oray.com/peanuthull/embed/phddns_rapi_3.0.2.armhf.deb
sudo dpkg -i phddns_rapi_3.0.2.armhf.deb

sudo apt-get -y autoremove

echo "############finish start setting,enjoy.Now reboot############"
sudo reboot

