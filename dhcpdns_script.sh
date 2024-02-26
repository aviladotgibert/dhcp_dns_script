#!/bin/bash

# Actualizar la lista de paquetes
apt update

# Instalar bind9, isc-dhcp-server y git
apt install -y bind9 isc-dhcp-server git

# Clonar el repositorio ddns_dhcp
git clone https://github.com/shad0wuser/ddns_dhcp.git

# Copiar la configuración de dhcp y bind
cp -r ddns_dhcp/dhcp /etc/
cp -r ddns_dhcp/bind /etc/

# Copiar otros archivos de configuración
cp -r ddns_dhcp/etc/* /etc/

# Cambiar el propietario y grupo de los archivos en /etc/bind a bind:bind
chown -R bind:bind /etc/bind

echo "Configuración completada."
