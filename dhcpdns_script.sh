#!/bin/bash

# Actualizar la lista de paquetes
apt update

# Instalar bind9, isc-dhcp-server y git
apt install -y bind9 isc-dhcp-server git

# Clonar el repositorio ddns_dhcp
git clone https://github.com/aviladotgibert/dhcp_dns_script.git

# Copiar la configuración de dhcp y bind
cp -r dhcp_dns_script/dhcp /etc/
cp -r dhcp_dns_script/bind /etc/

# Copiar otros archivos de configuración
cp -r dhcp_dns_script/etc/* /etc/

# Cambiar el propietario y grupo de los archivos en /etc/bind a bind:bind
chown -R bind:bind /etc/bind

echo "Configuración completada."
