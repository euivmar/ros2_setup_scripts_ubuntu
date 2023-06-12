#!/usr/bin/env bash

set -e

# Función para mostrar información al usuario
function mostrar_informacion {
    echo "----------------------------------------"
    echo "$1"
    echo "----------------------------------------"
}

# Directorio de trabajo
directorio_trabajo="$HOME/bookros2_ws/src"

# Verificar si el directorio ya existe
if [ -d "$directorio_trabajo" ]; then
    mostrar_informacion "El directorio de trabajo ya existe."
    mostrar_informacion "No es necesario crearlo nuevamente."
else
    mostrar_informacion "Creando directorio de trabajo..."
    mkdir -p "$directorio_trabajo"
    mostrar_informacion "Directorio de trabajo creado con éxito."
fi

# Clonar repositorio
mostrar_informacion "Clonando repositorio..."
cd "$directorio_trabajo"
if [ -z "$(ls -A .)" ]; then
    git clone "https://github.com/fmrico/book_ros2.git"
    mostrar_informacion "Repositorio clonado con éxito."
else
    mostrar_informacion "El directorio no está vacío. No se realizará la clonación."
fi

# Cargar dependencias
mostrar_informacion "Cargando dependencias..."
cd "$HOME/bookros2_ws/src"
vcs import . < book_ros2/third_parties.repos
mostrar_informacion "Dependencias cargadas con éxito."

# Instalar dependencias
mostrar_informacion "Instalando dependencias..."
cd "$HOME/bookros2_ws"
rosdep install --from-paths src --ignore-src -r -y
mostrar_informacion "Dependencias instaladas con éxito."

# Construir los paquetes
mostrar_informacion "Construyendo paquetes..."
cd "$HOME/bookros2_ws"
colcon build --symlink-install
mostrar_informacion "Paquetes construidos con éxito."

# Recargar los nuevos paquetes instalados
mostrar_informacion "Recargando nuevos paquetes instalados..."
source "$HOME/bookros2_ws/install/setup.bash"
echo "source $HOME/bookros2_ws/install/setup.bash" >> "$HOME/.bashrc"
mostrar_informacion "Recarga exitosa."

# Mostrar mensaje de finalización
mostrar_informacion "El script ha finalizado correctamente."
