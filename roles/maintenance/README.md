===================
# role: Maintenance
===================

## role maintenance

Die Rolle installiert folgende Tools: 

- <maintenance>
- <fastd-query>

## Installation auf

- gateways

## Location:

/usr/local/bin/

## Beschreibung der Tools:
### 1) maintenance 

<maintenance> ist ein kleines Komandozeilen-Tool, das den dhcp-service an- und abschalten kann

Das betrifft:
- isc-dhcp-server
- radvd

#### Nutzung:

<maintenance> ["on" | "off" | "status"]

[on]		: Schaltet dhcp ab!
[off]		: Schaltet dhcp wieder an!
[status]	: bei Maintenance="on": Zeitdauer des Maintenance-Modes

### 2) fastd-query

<fastd-query> ist ein kleines kommandozeilen-Tool, dass den Status der fastd-sockets anzeigt

#### Nutzung
