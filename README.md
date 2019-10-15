# sugar-startup
Shell scripts to start your raspberry pi project. 

树莓派开机脚本，自动完成初始化


Buster版本（19年4月以后绝大多数新版系统）的Raspbian执行：
```
git clone https://github.com/PiSugar/sugar-startup.git
sudo -s . ./sugar-startup/start_buster.sh
```

老版本执行：
```
git clone https://github.com/PiSugar/sugar-startup.git
sudo -s . ./sugar-startup/start.sh
```


初始化脚本执行以下内容：


* 更改国内镜像源

* 安装Pisugar微信小程序服务端

* 更新系统

* 安装拼音输入法

* 安装远程桌面

* 安装screen

* 安装syncthing

* 安装 ARIA2下载器(默认不安装，如需安装自行去掉前面的#)

* 安装phddns花生壳动态解析客户端
