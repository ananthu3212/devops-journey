#!/bin/bash
# Definiert das Backup Verzeichnis im Home Ordner
BACKUP_DIR=~/backups

# Erstellt das Backup Verzeichnis (wenn es nicht existiert)
mkdir -p $BACKUP_DIR

# Erstellt einen Zeitstempel für den Dateinamen (Jahr-Monat-Tag_Stunde-Minute-Sekunde)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Erstellt ein komprimiertes Archiv des test-data Ordners
# -c = create, -z = gzip, -f = file
tar -czf $BACKUP_DIR/backup-$TIMESTAMP.tar.gz ~/test-data

# Bestätigt den erfolgreichen Backup mit dem kompletten Pfad
echo "Backup completed: $BACKUP_DIR/backup-$TIMESTAMP.tar.gz"