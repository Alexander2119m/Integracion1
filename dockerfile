FROM node:20

# Create non-root user (nombre personalizado para evitar conflictos)
RUN useradd -m circleuser  # Cambiado de 'nodeuser' a 'circleuser'

WORKDIR /circle-app  # Cambiado de '/app' a '/circle-app'

# Copia e instala dependencias
COPY package*.json ./
RUN npm install

# Copia el resto del código
COPY . .

# Cambiar propietario de archivos a usuario no root
RUN chown -R circleuser:circleuser /circle-app  # Asegura permisos en el nuevo directorio

# Usa el usuario no root
USER circleuser

# Expón un puerto diferente (opcional, para evitar colisiones)
EXPOSE 8081  

# Comando de arranque (personaliza 'server.js' si es necesario)
CMD ["node", "server.js"]  # Mantén esto o cambia el archivo de entrada