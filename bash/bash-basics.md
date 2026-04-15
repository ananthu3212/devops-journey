# Bash Basics — Day 1

## Commands I learned today

- `mkdir -p` – creates entire path at once, if folders exist it just skips them
- `touch` – create an empty file
- `nano` – text editor to write scripts
- `cat` – show content of a file
- `chmod u+x` – add execute permission for owner
- `./script.sh` – run a script

## What I learned about variables

Variables store values. Syntax: VAR=value – no spaces around the =.

## What I learned about if/else

if [ condition ]; then
    # something
else
    # something else
fi

-gt means greater than.

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