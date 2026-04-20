#!/bin/bash
# Definiert eine Liste mit Servernamen
server="server1 server2 server3"

# Schleife durchläuft jeden Server in der Liste
for i in $server
do
    # Gibt den Namen des aktuellen Servers aus
    echo "checking : $i"
done