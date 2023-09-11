#!/usr/bin/env bash

set -euo pipefail

# Función para mostrar información al usuario
function mostrar_informacion {
    echo "----------------------------------------"
    echo "$1"
    echo "----------------------------------------"
}

# Instalar código de la simulación utilizando los paquetes anteriores
mostrar_informacion "Crea el workspace" 

directorio_destino=../turtlebot3_ws/src
archivo_repos=turtlebot3.repos

if [ ! -f "$archivo_repos" ]; then
    mostrar_informacion "El archivo $archivo_repos no existe en el directorio actual."
    exit 1
fi

mkdir -p "$directorio_destino"
cp "$archivo_repos" "$directorio_destino/$archivo_repos"
cd "$directorio_destino"

vcs import . < "$archivo_repos"

cd ..

mostrar_informacion "Compila el paquete"
chmod 777 -R .


colcon build --symlink-install

mostrar_informacion "Exporta el Source de install y lo guarda en el bashrc"
echo "source $HOME/turtlebot3_ws/install/setup.bash" >> "$HOME/.bashrc"

#Código de ejemplo para probar la instalación 

#export COLCON_TRACE=0
#export AMENT_TRACE_SETUP_FILES=0

#source ./install/setup.bash
#export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models
#export TURTLEBOT3_MODEL=waffle_pi
#ros2 launch turtlebot3_gazebo turtlebot3_house.launch.py
