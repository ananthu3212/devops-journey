#!/bin/bash
# Holt die Auslastung der Root-Partition und entfernt das % Zeichen
DISK=$(df / | grep / | awk '{print $5}' | tr -d '%')

# Prüft ob die Auslastung über 80% liegt
if [ $DISK -gt 80 ]; then
    echo "Warning disk is almost full"
else
    echo "disk is ok"
fi