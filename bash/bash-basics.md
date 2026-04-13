# Bash Basics — Day 1

## Commands I learned today

- `mkdir -p` – creates entire path at once, if folders exist it just skips them
- `touch` – create an empty file
- `nano` – text editor to write scripts
- `cat` – show content of a file
- `chmod u+x` – add execute permission for owner
- `./script.sh` – run a script

## The script I wrote

**File:** `system-info.sh`

```bash
#!/bin/bash
# Gibt den Hostnamen des Servers aus
echo "Hostname: $(hostname)"

# Gibt den aktuellen Benutzer aus
echo "Current User: $(whoami)"

# Gibt das aktuelle Datum und Uhrzeit aus
echo "Current Date: $(date)"