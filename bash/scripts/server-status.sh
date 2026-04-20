**server-status.sh**
#!/bin/bash
# Definiert eine Liste mit Servernamen
server="web-server db-server cache-server"

# Schleife durchlaeuft jeden Server in der Liste
for i in $server
do
    echo "Checking: $i"

    # Prueft ob der Servername "db" enthaelt
    if [[ $i == *db* ]]; then
        echo "Database server detected"
    else
        echo "Regular server"
    fi
done