# Usamos la imagen oficial de n8n como base
FROM docker.n8n.io/n8nio/n8n:latest

# Cambiamos al usuario root temporalmente para poder instalar paquetes globales
USER root

# Aquí instalas los paquetes que necesites separados por espacio
# (Ejemplo: lodash y moment)
RUN npm install -g lodash moment

# Volvemos al usuario 'node' por seguridad, como exige n8n
USER node
