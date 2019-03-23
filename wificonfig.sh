#/bin/bash
git clone https://github.com/PiSugar/sugar-wifi-conf.git
cd sugar-wifi-conf/build
sudo chmod 777 binding.node
sudo chmod 777 sugar-wifi-conf
sudo sed -i '/exit 0/i sudo /home/pi/sugar-wifi-conf/build/sugar-wifi-conf' /etc/rc.local
