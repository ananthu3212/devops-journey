# Bash Basics — Day 2

## Commands I learned today

- `mkdir -p` – creates entire path at once, if folders exist it just skips them
- `touch` – create an empty file
- `nano` – text editor to write scripts
- `cat` – show content of a file
- `chmod u+x` – add execute permission for owner
- `./script.sh` – run a script
- `sudo` – run a command as root (administrator)
- `tar -czf` – create compressed archive (.tar.gz)
- `date +"%Y-%m-%d_%H-%M-%S"` – generate timestamp for filenames

## What I learned about variables

Variables store values. Syntax: VAR=value – no spaces around the =.

## What I learned about if/else

if [ condition ]; then
    # something
else
    # something else
fi

-gt means greater than.
= means equal to (for strings).

## What I learned about awk

awk '{print $5}' prints the 5th column. Spaces matter – no extra spaces inside the braces.

## What I learned about tr -d

tr -d '%' deletes the % sign. Space after -d is required.

## Why you cannot use df -h for comparison

df -h gives output like 12% or 5G. if needs a pure number. df without -h gives raw numbers.

## The pipeline explained

The full pipeline `df / | grep / | awk '{print $5}' | tr -d '%'` takes the disk usage of root partition, filters to the right line, extracts the percentage column, and removes the percent sign to leave a pure number.

## Script 1: system-info.sh

#!/bin/bash
# Gibt den Hostnamen des Servers aus
echo "Hostname: $(hostname)"

# Gibt den aktuellen Benutzer aus
echo "Current User: $(whoami)"

# Gibt das aktuelle Datum und Uhrzeit aus
echo "Current Date: $(date)"

## Script 2: disk-alert.sh

#!/bin/bash
# Holt die Auslastung der Root-Partition und entfernt das % Zeichen
DISK=$(df / | grep / | awk '{print $5}' | tr -d '%')

# Prüft ob die Auslastung über 80% liegt
if [ $DISK -gt 80 ]; then
    echo "Warning disk is almost full"
else
    echo "disk is ok"
fi

## Script 3: service-check.sh

#!/bin/bash
# Prüft ob nginx läuft
STATUS=$(systemctl is-active nginx)

# Wenn aktiv, Bestätigung ausgeben
if [ $STATUS = "active" ]; then
    echo "the server is running"
else
    # Wenn nicht aktiv, starten mit sudo
    sudo systemctl start nginx
    echo "server is restarted"
fi

## Script 4: backup.sh

#!/bin/bash
BACKUP_DIR=~/backups
mkdir -p $BACKUP_DIR
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
tar -czf $BACKUP_DIR/backup-$TIMESTAMP.tar.gz ~/test-data
echo "Backup completed: $BACKUP_DIR/backup-$TIMESTAMP.tar.gz"

## What sudo does

sudo runs a command as root (administrator). Normal users cannot start system services like nginx. sudo gives you temporary admin power to do it.

## Mistakes I made

Mistake 1: Spaces in variable assignment
- Wrong: DISK =$(command)
- Fix: DISK=$(command)

Mistake 2: Using df instead of df /
- Wrong: df shows everything
- Fix: df / targets root partition

Mistake 3: Extra spaces in awk
- Wrong: awk ' { print $5 } '
- Fix: awk '{print $5}'

Mistake 4: No space after tr -d
- Wrong: tr -d'%'
- Fix: tr -d '%'

Mistake 5: Missing execute permission
- Fix: chmod u+x script.sh

Mistake 6: Forgot sudo inside service-check.sh
- What happened: Ran the script without sudo, systemctl tried to start nginx but failed with permission denied
- Fix: Added sudo before systemctl start nginx
- What I learned: sudo is required when a normal user needs to control system services

Mistake 7: Confused about mkdir -p position in backup.sh
- What confused me: I thought mkdir -p should be first line, but it was second line after BACKUP_DIR variable
- What I tried: Ran script both ways
- What I saw: If mkdir -p comes before BACKUP_DIR, it still works but BACKUP_DIR variable is empty when used
- What I learned: Order matters. BACKUP_DIR must be defined first so mkdir -p knows where to create the directory

Mistake 8: Confused why $ was not in BACKUP_DIR=~/backups
- What confused me: I thought variables always need $ sign
- What I learned: $ is only used when accessing a variable, not when creating it. BACKUP_DIR=~/backups creates it. $BACKUP_DIR accesses it.