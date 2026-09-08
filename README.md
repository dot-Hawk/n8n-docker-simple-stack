# 🚀 n8n Production-Ready Docker Stack

Una plantilla robusta y optimizada para desplegar una instancia autohospedada de **n8n** utilizando Docker Compose. Está diseñada con una arquitectura escalable orientada a producción, separando servicios mediante **PostgreSQL** como base de datos y **Redis** en modo cola (*Queue Mode*).

---

## 📋 Características de la Arquitectura
* **Base de Datos Persistente:** PostgreSQL 16 para garantizar la integridad de los flujos y credenciales.
* **Gestión de Colas:** Redis 7 para desacoplar las ejecuciones pesadas mediante el sistema de *Workers*.
* **Dockerfile Personalizado:** Permite inyectar librerías globales de Node.js (como `lodash`, `moment`, etc.) directamente en los nodos de código.
* **Entorno Seguro:** Preparado para aislar ejecuciones y escalar de forma limpia.

---

## 🛠️ Prerrequisitos: Instalación de Docker

Si ya tienes Docker y Docker Compose instalados en tu computadora, puedes saltar directamente al [Paso de Despliegue](#-pasos-para-el-despliegue). Si no los tienes, sigue las instrucciones según tu sistema operativo:

### 🐧 Para Linux (Arch Linux / Ubuntu / Debian)

Abre tu terminal y ejecuta los comandos correspondientes a tu distribución:

* **En Arch Linux:**
  ```bash
  sudo pacman -Syu
  sudo pacman -S docker docker-compose
  sudo systemctl enable --now docker

# En Ubuntu / Debian / Linux Mint:
  ```bash
  sudo apt update
  sudo apt install -y docker.io docker-compose-v2
  sudo systemctl enable --now docker
  ```

## Dar permisos a tu usuario (Opcional pero recomendado para no usar sudo):
  ```bash
  sudo usermod -aG docker $USER
  newgrp docker
  ```

# 🪟 Para Windows
## 1. Instalar WSL 2 (Subsistema de Windows para Linux):
Abre PowerShell como Administrador y ejecuta:
```bash
  wsl --install
  ```
### (Reinicia tu computadora si el sistema te lo solicita).

## 2. Descargar e instalar Docker Desktop:

Entra a la página oficial de Docker Desktop para Windows.

Descarga el instalador, ejecútalo y asegúrate de marcar la opción de habilitar los componentes de WSL 2 durante la instalación.

Una vez instalado, abre la aplicación Docker Desktop y espera a que el icono de la esquina inferior izquierda se ponga en verde (indicando que el motor está corriendo).

# 🚀 Pasos para el Despliegue
### Una vez que tengas Docker funcionando en tu sistema, sigue estos pasos para poner en marcha el proyecto:

## 1. Clonar o descargar el repositorio
Abre tu terminal en la carpeta donde quieras tener el proyecto y clónalo (o descarga los archivos):

  ```bash
  git clone [https://github.com/tu-usuario/n8n-docker-stack.git](https://github.com/tu-usuario/n8n-docker-stack.git)
cd n8n-docker-stack
  ```

## 2. Configurar las variables de entorno
Crea tu archivo de configuración real basándote en el ejemplo provisto:

  ```bash
  cp .env.example .env
  ```
### Abre el archivo .env con tu editor de texto favorito (como nano, VS Code o el Bloc de notas) y rellena los valores obligatorios:

Cambia las contraseñas de PostgreSQL.

Define una clave segura para N8N_ENCRYPTION_KEY (puedes generar una cadena alfanumérica larga).

## 3. Levantar la infraestructura
Ejecuta el siguiente comando en la raíz del proyecto para construir la imagen personalizada de n8n y arrancar todos los contenedores en segundo plano:

  ```bash
  docker compose up -d --build
  ```

## 4. Verificar que todo esté corriendo
Puedes comprobar el estado de los contenedores ejecutando:

  ```bash
  docker compose ps
  ```
### Todos los servicios (postgres, redis, n8n, n8n-worker) deben figurar con estado Up.

## 🌐 Uso de la Aplicación
Abre tu navegador web y entra a: http://localhost:5678

La primera vez, la interfaz te pedirá registrar tu cuenta de Administrador.

¡Listo! Ya puedes empezar a crear flujos de trabajo profesionales y automatizaciones escalables.





