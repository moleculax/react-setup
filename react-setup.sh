#!/bin/bash
# ==========================================================
# 🚀 Script de configuración React para GNU/Linux
# Autor: Emilio J. Gomez
# Descripción: Crea un proyecto React, instala dependencias
# y genera un componente base.
# ==========================================================

# --- Colores para mensajes ---
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # Sin color

echo -e "${CYAN}=== Script de instalación y configuración de React ===${NC}"

# 1. Instalar React (create-react-app)
read -p "¿Deseas instalar create-react-app globalmente? (Y/N): " install_react
if [[ $install_react =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Instalando create-react-app...${NC}"
    npm install -g create-react-app
    echo -e "${GREEN}create-react-app instalado correctamente.${NC}"
fi

# 2. Crear proyecto React
read -p "¿Deseas crear un nuevo proyecto React? (Y/N): " create_project
if [[ $create_project =~ ^[Yy]$ ]]; then
    read -p "Introduce el nombre del proyecto: " project_name
    echo -e "${YELLOW}Creando proyecto React llamado '${project_name}'...${NC}"
    npx create-react-app "$project_name"
    cd "$project_name" || exit
    echo -e "${GREEN}Proyecto '${project_name}' creado correctamente.${NC}"
else
    echo -e "${YELLOW}No se creó ningún proyecto.${NC}"
    exit 0
fi

# 3. Instalar dependencias de estilos
read -p "¿Deseas instalar Bootstrap y frameworks de estilos? (Y/N): " install_styles
if [[ $install_styles =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Instalando Bootstrap...${NC}"
    npm install bootstrap
    echo -e "${GREEN}Bootstrap instalado correctamente.${NC}"
    echo -e "${YELLOW}Puedes importarlo en src/index.js con:${NC}"
    echo "import 'bootstrap/dist/css/bootstrap.min.css';"
fi

# 4. Instalar Axios
read -p "¿Deseas instalar Axios? (Y/N): " install_axios
if [[ $install_axios =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Instalando Axios...${NC}"
    npm install axios
    echo -e "${GREEN}Axios instalado correctamente.${NC}"
fi

# 5. Instalar React Icons
read -p "¿Deseas instalar React Icons? (Y/N): " install_icons
if [[ $install_icons =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Instalando React Icons...${NC}"
    npm install react-icons
    echo -e "${GREEN}React Icons instalado correctamente.${NC}"
fi

# 6. Crear componente React
read -p "¿Deseas crear un nuevo componente? (Y/N): " create_component
if [[ $create_component =~ ^[Yy]$ ]]; then
    read -p "Introduce el nombre del componente: " component_name
    mkdir -p src/components
    component_path="src/components/${component_name}.jsx"
    echo -e "${YELLOW}Creando componente ${component_name}.jsx...${NC}"

    cat <<EOF > "$component_path"
import React, { useEffect, useState } from 'react';
import axios from 'axios';

const ${component_name} = () => {
    const [data, setData] = useState(null);

    useEffect(() => {
        // Ejemplo de uso de Axios:
        // axios.get('https://api.example.com/data')
        //      .then(response => setData(response.data))
        //      .catch(error => console.error(error));
    }, []);

    return (
        <div className="container mt-4">
            <h2>${component_name} Componente</h2>
            <p>Ejemplo de componente React funcional.</p>
            {data && <pre>{JSON.stringify(data, null, 2)}</pre>}
        </div>
    );
};

export default ${component_name};
EOF

    echo -e "${GREEN}Componente '${component_name}.jsx' creado correctamente en src/components/.${NC}"
else
    echo -e "${YELLOW}No se creó ningún componente.${NC}"
fi

echo -e "${CYAN}=== Configuración completada ===${NC}"
echo -e "Para iniciar el proyecto ejecuta: ${GREEN}npm start${NC}"
