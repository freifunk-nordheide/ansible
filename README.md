Aufsetzen von Servern für Freifunk-Nordheide
============================================

# Vorbemerkung : Infrastrukturplan ffnh:
## site und hoods


# Teil 1: Voraussetzungen auf den VMs

## 1.1: Debian 10 - Buster
## 1.2: Python installieren (Voraussetzung für ansible)
## 1.3: User: Muss ohne Passworteingabe sudo su können
## 1.4: Keyfile bereitstellen (ssh ohne Passwort)

# Teil 2: Basis-Infos
## 2.1: IP-Adress-Bereiche
### 2.2.1 IPv4
### 2.2.2 IPv6
## 2.2: Namen der Einheiten


# Teil 3: Server mit bestehenden Parametern
## 3.1: Gateway
### 3.1.1: Struktur





## 3.2: Map-Server
### 3.2.1. Überblick

Ein Map-Server nutzt zur Zeit den meshviewer und wird hier ohne fastd aufgebaut. 
Der Map-Server holt sich die Daten per wget von den Gateways (jedes Gateway erzeugt seine eigene "meshviewer.json", die als Voraussetzung vorhanden sein muss); außerdem können auch noch weitere "meshviewer.json" eingebunden werden.
Da es doch ab und zu vorkam, dass ein wget nicht erfolgreich durchgeführt werden konnte (Gateway down, Datei leer), wird dieser Zustand abgefangen. Je Hood (domain) werden im Normalfall redundant zwei "meshviewer.json" (eine je Gateway) erzeugt; wenn mindestens eine der Dateien per wget erreichbar ist und diese Datei nicht leer ist, werden die Inhalte angezeigt. Ist keine gültige Datei vorhanden, wird ein Dummy-Knoten (mit Positionsdaten in der Nordsee vor Cuxhaven) angezeigt; der Name des Knoten zeigt dann das Problem ;-) - alle weiteren gezeigten Daten sind irrelevant! Eine "meshviewer.json" wird für diesen Fall wärend der Konfiguration des Map-Servers vorbereitet und im Fehlerfall herangezogen.

Diese Aktionen erfolgen per Script, welches bei der Konfiguration (siehe Unten) des Map-Servers erzeugt wird. 

Die Datenstruktur ist wie folgt:

- Basis Directory: 	/var/www/html/meshviewer/data
- Hood/Domain Dir.: 	/var/www/html/meshviewer/data/XX/ (XX=Nummer der Hood - Altdaten liegen z.Zt unter "A1")
- meshviewer.json:	/var/www/html/meshviewer/data/XX/meshviewer.json
- Ausnahme Dir.:	/var/www/html/meshviewer/data/XX/offline/
- Ausnahme meshv...json	/var/www/html/meshviewer/data/XX/offline/meshviewer.json

- Script:			/usr/local/bin/get_nodevalues

Die jeweiligen Konfigurationsdaten befinden sich unter "hostvars".

Zur Anzeige der derzeit unterstützten Bereiche, werden zusätzliche Geodaten zur Verfügung gestellt. Diese Geodaten (im Wsentlichen Polygone zur Abgrenzung der einzelnen Hoods) werden in der Datei "areafeatures.json" im Dir. data/geodata/ bereitgestellt.

### 3.2.2 Ansible roles

Für den Aufbau und die Konfiguration des Map-servers sind derzeit zwei Rollen verantworlich:

- meshviewer-install (Basis-Installation)
- meshviewer-config (Durchführung von Konfigurationsänderungen - einmal zu Beginn und bei Änderung der config.js bzw. Anderung der Daten (hostvars) oder areafeatures)

## 3.4: Statistik-Server
### 3.4.1. Überblick



# Teil 3: Neuen Server bauen




# 
