#!/bin/bash

# Actualizar la lista de paquetes
apt update

# Instalar bind9, isc-dhcp-server y git
apt install -y bind9 isc-dhcp-server git

# Clonar el repositorio ddns_dhcp
git clone https://github.com/aviladotgibert/dhcp_dns_script.git

# Copiar la configuración de dhcp y bind
cp -r -f dhcp_dns_script/dhcp /etc/dhcp/
cp -r -f dhcp_dns_script/bind /etc/bind/

# Copiar otros archivos de configuración
cp -r -f dhcp_dns_script/etc/* /etc/

#Arreglar lo que dijo Alina del enlace simbolico para el resolv.conf
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

# Cambiar el propietario y grupo de los archivos en /etc/bind a bind:bind
chown -R bind:bind /etc/bind

#Reiniciamos servicios para guardar cambios
systemctl restart isc-dhcp-server
systemctl restart bind9

echo "Configuración completada."
