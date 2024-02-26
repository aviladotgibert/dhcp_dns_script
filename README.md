Este script esta basado en el del siguiente Github: https://github.com/shad0wuser/ddns_dhcp

Se han modificado los parametros de los archivos para su funcionamiento, la configuración general es la siguiente:
```txt
Red: 10.0.2.0/24
Máscara: 255.255.255.0
IP server: 10.0.2.4
Rango de Ips: 10.0.2.128 10.0.2.254
DNS: 10.0.2.4
Gateway: 10.0.2.1 //el GW de salida de la red NAT
Broadcast: 10.0.2.255
Tiempo de arrendamiento (lease-time): 600s
Hostname: haven.local
DNS: ns1.haven.local
Records: A, MX
```

# Dynamic DNS and DHCP (bind9 & isc-dhcp-server)
Para que funcione esto, simplemente escribe el siguiente comando:
```bash
curl -sSL https://github.com/aviladotgibert/dhcp_dns_script/dhcpdns_script.sh | bash
```


## Generating the key to secure DNS / DHCP exchanges

Generate your secret key.
```bash
dnssec-keygen -a HMAC-MD5 -b 128 -r /dev/urandom -n USER DDNS_UPDATE
```
It will generate two key files. Just copy the **key** in `Kddns_update.+157+57083.private` and paste to **secret** case on `ddns.key` file.

The both files `/etc/bind/ddns.key` and `/etc/dhcp/ddns.key` must be identical.

## Change configuration files, replace with your values and run
```bash
services bind9 restart
service isc-dhcp-server restart
```
