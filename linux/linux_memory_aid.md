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

---

## Process Management
- `ps aux` – list all running processes
- `ps aux | grep process_name` – find specific process
- `top` – interactive process viewer (real‑time, press `q` to quit, `k` to kill)
- `htop` – improved top (if installed: `sudo apt install htop`)
- `kill PID` – send SIGTERM (ask process to terminate gracefully)
- `kill -9 PID` – force kill with SIGKILL (use when process hangs)

---

## Network
- `ping -c 4 host` – send 4 ICMP packets to check connectivity (e.g., `ping -c 4 google.com`)
- `sudo netstat -tulpn` – show listening ports and associated processes (older, often needs sudo)
- `sudo ss -tulpn` – modern replacement for netstat (faster, more detailed)
- `sudo netstat -tulpn | grep :22` – find process using port 22 (SSH)
- `nc -zv host port` – check if a specific port is open (e.g., `nc -zv google.com 80`)

**Port states:**
- `LISTEN` – server is waiting for incoming connections
- `ESTABLISHED` – active connection between client and server

---

## Permissions
- `chmod +x script.sh` – make script executable
- `chmod 755 script.sh` – set standard permissions (rwx for owner, rx for group/others)
- `whoami` – show current username
