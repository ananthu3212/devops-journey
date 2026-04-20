#!/bin/bash
# Definiert eine Funktion die einen Server ueberprueft
checkServer() {
    # Gibt den Namen des uebergebenen Servers aus
    echo "Checking: $1"
    # Gibt den Status aus
    echo "status:ok"
}

# Definiert eine Liste mit Servernamen
serverName="web-server db-server cache-server"

# Schleife durchlaeuft jeden Server in der Liste
for i in $serverName
do
    # Ruft die Funktion checkServer mit dem aktuellen Server als Argument auf
    checkServer "$i"
done