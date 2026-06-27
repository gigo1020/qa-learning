# Linux Cheatsheet for QA

## Navigation
- `pwd` – print current directory
- `ls -la` – list all files (including hidden) with details
- `cd /path` – change directory
- `cd ~` – go to home directory
- `cd ..` – go one level up
- `cd -` – go to previous directory

## File & Directory Operations
- `mkdir dir` – create directory
- `mkdir -p a/b/c` – create nested directories
- `touch file` – create empty file or update timestamp
- `cp source dest` – copy file
- `cp -r source dest` – copy directory recursively
- `mv old new` – move or rename
- `rm file` – remove file
- `rm -r dir` – remove directory with content
- `rm -f file` – force remove without confirmation

## Viewing File Content
- `cat file` – show entire file (small files)
- `less file` – view file page by page (space=forward, b=backward, q=quit, /search)
- `head -n N file` – show first N lines
- `tail -n N file` – show last N lines
- `tail -f file` – follow file updates in real time

## Searching & Filtering
- `grep "pattern" file` – find lines containing pattern
- `grep -i "pattern" file` – case-insensitive
- `grep -c "pattern" file` – count matches
- `grep -C N "pattern" file` – show N lines of context
- `grep -r "pattern" .` – recursive search in current directory
- `grep -v "pattern" file` – invert match (show lines NOT containing pattern)

## Pipes & Redirection
- `command1 | command2` – pipe output of command1 to command2
- `command > file` – write output to file (overwrite)
- `command >> file` – append output to file

## Process Management
- `ps aux` – list all running processes
- `ps aux | grep process_name` – find specific process


## Permissions
- `chmod +x script.sh` – make script executable


## System Info
- `whoami` – current user
