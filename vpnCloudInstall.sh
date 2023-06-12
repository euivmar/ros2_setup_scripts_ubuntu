#!/usr/bin/env bash
# source: https://vpncloud.ddswd.de/install/


echo "deb https://repo.ddswd.de/deb stable main" | sudo tee /etc/apt/sources.list.d/vpncloud.list
wget https://repo.ddswd.de/deb/public.key -qO - | sudo apt-key add
sudo apt update
sudo apt install vpncloud
