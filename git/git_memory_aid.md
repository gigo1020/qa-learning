# Git Commands Cheatsheet

## Setup & Configuration
- `git config --global user.name "Name"` – set username
- `git config --global user.email "email"` – set email
- `git config --global credential.helper store` – save credentials permanently

## Basic Workflow
- `git init` – create new repo
- `git clone <url>` – copy remote repo locally
- `git status` – show changes
- `git add <file>` – stage changes
- `git commit -m "message"` – commit staged changes
- `git commit -am "message"` – commit all tracked files (skip add)
- `git push` – upload commits to remote
- `git pull` – download and merge from remote
- `git fetch` – download but not merge

## Branches
- `git branch` – list branches
- `git branch <name>` – create branch
- `git checkout <name>` – switch branch
- `git switch <name>` – switch branch (newer)
- `git checkout -b <name>` – create and switch
- `git merge <branch>` – merge branch into current
- `git branch -d <name>` – delete branch (if merged)
- `git branch -D <name>` – force delete branch

## Undoing Changes
- `git reset --soft HEAD~1` – undo last commit, keep changes staged
- `git reset --hard HEAD~1` – undo last commit, discard changes (careful)
- `git revert HEAD` – create a new commit that undoes the last commit (safe)
- `git checkout -- <file>` – discard local changes in file

## History
- `git log` – full history
- `git log --oneline` – compact history
- `git log --since="1 week ago"` – filter by time

## Remote
- `git remote -v` – show remote URLs
- `git remote add origin <url>` – add remote
- `git push -u origin <branch>` – push and set upstream
- `git push origin --delete <branch>` – delete remote branch

## Conflict Resolution
1. Open conflicted file – look for `<<<<<<<`, `=======`, `>>>>>>>`
2. Edit to keep the desired code
3. Remove conflict markers
4. `git add <file>`
5. `git commit` (Git will create merge commit)