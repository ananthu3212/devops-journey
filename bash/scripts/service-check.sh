#!/bin/bash

# Speichert den aktuellen Status von nginx in einer Variable
STATUS=$(systemctl is-active nginx)

# Prüft ob nginx aktiv ist
if [ $STATUS = "active" ]; then
    echo "the server is running"
else
    # Startet nginx neu falls es nicht läuft
    sudo systemctl start nginx
    echo "server is restarted"
fi