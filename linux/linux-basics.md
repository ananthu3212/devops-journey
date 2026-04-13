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

## What I understood

- How to move around directories and create files and folders
- Using `grep` to search inside files for specific words
- Using pipe to send output from one command to another
- Linux permissions: owner, groups, others – each one has different permissions
- How to search for files and only pull out specific words from them
- `find` is for finding files and folders by name
- `grep` is for finding things inside a file

## What confused me

I got confused between `grep` and `find` at first.

Now I get it – `find` looks for files and folders by name. `grep` looks inside a file to find words or text.

Also got confused about groups vs others. Then I learned:

- **Groups** – If 10 developers are working on the same thing, instead of setting permissions for each person one by one, they all get the same group permissions.
- **Others** – Everyone else who is not the owner and not part of that group.