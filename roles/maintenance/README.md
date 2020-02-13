===================
# role: Maintenance
===================

## role maintenance

Die Rolle installiert das Tool <maintenance>

## Installation auf

- gateways

## Location:

/usr/local/bin/


## Beschreibung des Tools: 

<maintenance> ist ein kleines Komandozeilen-Tool, das den dhcp-service an- und abschalten kann

Das betrifft:
- isc-dhcp-server
- radvd

## Nutzung:

<maintenance> ["on" | "off" | "status"]

[on]		: Schaltet dhcp ab!
[off]		: Schaltet dhcp wieder an!
[status]	: bei Maintenance="on": Zeitdauer des Maintenance-Modes


