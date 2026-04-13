# Linux Basics — Day 1

## Commands I learned today

- `cd` – change directory
- `ls -la` – list all files with detailed permissions
- `grep` – search for specific words inside files
- `mkdir` – create a new directory
- `touch` – create a new file
- `|` (pipe) – send output of one command as input to another
- `find . -name "*.txt"` – find all txt files in current folder
- `find . -name "health*.txt"` – find txt files that start with "health"
- `grep "word" file.txt` – find a specific word inside a file
- `chmod u-x file.txt` – remove execute permission from the owner
- `df` – how much space is left on the entire disk
- `du` – how much space a specific folder is using
- `ps aux` – show all running processes
- `kill` – stop a running process
- `tail` – show the last few lines of a file
- `tail -f` – follow a file in real time as new lines get added
- `systemctl` – control system services (start, stop, restart, enable, status)

## What I understood

- How to move around directories and create files and folders
- Using `grep` to search inside files for specific words
- Using pipe to send output from one command to another
- Linux permissions: owner, groups, others – each one has different permissions
- How to search for files and only pull out specific words from them
- `find` is for finding files and folders by name
- `grep` is for finding things inside a file
- `chmod` changes permissions – u for owner/user, g for group, o for others, + to add, - to remove
- `df` tells you disk space at the system level (whole disk)
- `du` tells you disk usage at the folder level
- `ps aux` shows every process running on the system with details
- `kill` lets you stop a process by its PID
- `tail` shows the end of a log file – useful for checking recent activity
- `tail -f` keeps watching the file and shows new lines as they come – great for monitoring live logs
- `systemctl` is how you manage services like nginx, docker, ssh

**Real-world example for df vs du:** Your server disk is 90% full. `df` tells you the disk is almost full. But which folder is eating all the space? You use `du` to find the culprit.

**Real-world example for tail -f:** You just started your app and it's crashing. You run `tail -f /var/log/nginx/error.log` and watch the errors appear live as they happen.

## What confused me

I got confused between `grep` and `find` at first.

Now I get it – `find` looks for files and folders by name. `grep` looks inside a file to find words or text.

Also got confused about groups vs others. Then I learned:

- **Groups** – If 10 developers are working on the same thing, instead of setting permissions for each person one by one, they all get the same group permissions.
- **Others** – Everyone else who is not the owner and not part of that group.

One more thing – I messed up the space in `chmod`. I wrote `u - x db_response.txt` with spaces everywhere. Then I figured out the correct syntax is `u-x` with no spaces.

Also got confused between `du` and `df` at first. Then I understood – `df` looks at the whole disk, `du` looks at specific folders. Big picture vs detailed search.