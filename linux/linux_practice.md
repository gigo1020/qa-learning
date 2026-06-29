# Linux Practice Log

## Day 1 – Navigation and Filesystem (Day 16 overall)

**Goals:** Learn to navigate the filesystem, create/remove files and directories, copy, move, rename.

**Commands practiced:** `pwd`, `ls`, `cd`, `mkdir`, `touch`, `cp`, `mv`, `rm`, `rmdir`

**Activities:**
- Explored `/var/log`, `~`, `/tmp`
- Created directory structure
- Created files: `header.js`, `app.js`, `footer.js`
- Copied `app.js` to `utils/`
- Renamed `header.js` → `Header.js`
- Removed `footer.js` and a backup folder using `rm -r`

**Key learnings:**
- Absolute path vs relative path
- Using `..` to go up one level
- `ls -R` to see directory tree

**Files created:** (saved in `linux/logs/`)
- `README.md` with `# Linux Practice`
- `config.json` in `config/`

---

## Day 2 – Logs, grep, and Pipes (Day 17 overall)

**Goals:** View and search log files, combine commands with pipes, redirect output.

**Commands practiced:** `cat`, `less`, `head`, `tail`, `tail -f`, `grep` (with `-i`, `-c`, `-C`, `-r`), `wc`, `|`, `>`, `>>`

**Activities:**
- Viewed `/var/log/syslog` using `less` and `tail -f`
- Searched for errors: `grep -i "error" syslog`
- Counted errors: `grep -i -c "error" syslog`
- Found errors with 3 lines of context: `grep -i -C 3 "error" syslog`
- Created a test log file `test.log` with sample entries (INFO, ERROR, WARNING)
- Used `tail -f` to watch live updates (simulated by writing from another terminal)
- Filtered only ERROR lines into `errors_only.log`
- Counted total errors in test log

**Pipes & redirection examples:**
- `grep -i "error" syslog | tail -n 5` – last 5 errors
- `grep -i "fail" syslog > ~/errors.txt` – save failures to file
- `wc -l ~/errors.txt` – count lines in saved file

**Generated files (now in `linux/logs/`):**
- `test.log` – sample log with mixed levels
- `errors_only.log` – only ERROR lines from test log
- `errors.txt` – failures from system log (from Day 1)

---

## Next Steps (Day 18 overall):
- Process management (`ps`, `top`, `kill`)
- Network commands (`netstat`, `ping`)
- Permissions (`chmod`, `chown`)
- Will update this log accordingly

---

## Day 3 – Processes, Network, and Permissions (Day 18 overall)

**Goals:** Learn to manage processes (view, monitor, kill), diagnose network connectivity, check open ports, and manage file permissions.

**Commands practiced:** `ps aux`, `top`, `kill`, `kill -9`, `ping`, `netstat`, `ss`, `chmod`, `whoami`

**Activities:**
- Listed all running processes (`ps aux`) and filtered by user (`grep $USER`).
- Used `top` to see processes in real time and exited with `q`.
- Created a "hanging" process (`sleep 300`) and practiced graceful termination (`kill PID`) and forced termination (`kill -9 PID`).
- Checked network connectivity to `google.com` with `ping -c 4`.
- Examined listening ports using `sudo netstat -tulpn` and `sudo ss -tulpn`; identified which process occupies port 22 (SSH).
- Created a simple shell script `test_script.sh`, observed "Permission denied", then made it executable with `chmod +x` and ran it successfully.
- Used `whoami` to verify current user.

**Key learnings:**
- `kill -9` should be used only when a process is unresponsive to normal `kill`.
- `netstat` and `ss` show which services are waiting for connections (`LISTEN`) – essential for debugging service availability.
- `chmod +x` is necessary to execute scripts; without it, Linux blocks execution for security.
- Ports like 22 (SSH), 80 (HTTP), 443 (HTTPS) are common; knowing how to check them helps when testing services.

**Files created:**
- `~/linux-practice/test_script.sh` – simple executable script used to test permissions.