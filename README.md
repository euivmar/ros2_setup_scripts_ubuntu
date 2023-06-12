# ros2_setup_scripts_ubuntu

[![GitHub Actions](https://github.com/Tiryoh/ros2_setup_scripts_ubuntu/workflows/ROS2%20install%20test/badge.svg)](https://github.com/Tiryoh/ros2_setup_scripts_ubuntu/actions/workflows/main.yml?query=workflow%3A%22ROS2+install+test%22)

unofficial ROS2 install script for Ubuntu

Access https://index.ros.org/doc/ros2/Installation/ to get the updated information.

#Tutorials & Extra software
A Concise Introduction to Robot Programming with ROS2 - Code Repository
https://github.com/fmrico/book_ros2 -> installBookWs.sh

Turtlebot 3
https://github.com/ROBOTIS-GIT -> installTurtlebot3SIM.sh (apt-get install)
                               -> installTurtlebot3SIM_WS.sh (Create Workspace)

vpnCloud
https://vpncloud.ddswd.de/  -> vpnCloudInstall.sh (apt-get install)
                           

## QuickStart

After downloading this repository, just run the following command.

```sh
./run.sh
```


## Usage

By default, `run.sh` will install `ros-humble-desktop`.   
If you need to install another package, edit line8-9 in `run.sh`.

```sh
CHOOSE_ROS_DISTRO=humble # or galaxy
INSTALL_PACKAGE=desktop # or ros-base
```

For example, if you want to install ros-base package of ROS 2 Foxy,
edit like the followings.

```sh
CHOOSE_ROS_DISTRO=galaxy # or humble, etc...
INSTALL_PACKAGE=ros-base # or ros-base
```

After editing, run `run.sh` to install the packages.

```sh
./run.sh
```

### Individual installers

In addition, there are other ways to use the installers.

ROS 2 Galactic (EOL)

* To install `ros-galactic-ros-base`, use [`ros2-galactic-ros-base-main.sh`](./ros2-galactic-ros-base-main.sh) instead of `run.sh`.
* To install `ros-galactic-desktop`, use [`ros2-galactic-desktop-main.sh`](./ros2-galactic-desktop-main.sh) instead of `run.sh`.

## Supported LTS Versions

Reference: [REP-0003](https://ros.org/reps/rep-0003.html), [REP-2000](https://ros.org/reps/rep-2000.html)

| Ubuntu | ROS 1 | ROS 2 |
| ------ | ----- | ----- |
| Ubuntu 22.04<br>EOL: May 2027 | - | Humble<br>EOL: May 2027 |


## LICENSE

```
Copyright 2019-2023 Tiryoh

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

### Acknowledgements

`run.sh` is based on https://index.ros.org/doc/ros2/Installation/Crystal/Linux-Install-Debians/
by Open Robotics, licensed under CC-BY-4.0.  

`tutorial.sh` is based on https://index.ros.org/doc/ros2/Tutorials/Colcon-Tutorial/
by Open Robotics, licensed under CC-BY-4.0.  

source: https://github.com/ros2/ros2_documentation

Acknowledgements to their respective authors of Tutorials & Extra software