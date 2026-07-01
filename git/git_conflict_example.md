# Example of Resolving a Git Merge Conflict

## Scenario
We have two branches:
- `main` – stable branch
- `feature/new-button` – adds a new button to `index.html`

Both branches modified the same line in `index.html`.

## How Conflict Occurred
1. On `main`, we changed the header text to `"Welcome to the site"`.
2. On `feature/new-button`, we changed the same line to `"Welcome to our new site"`.
3. When we tried to merge `feature/new-button` into `main`, Git couldn't decide which version to keep.

## Conflict Markers in File
```html
<<<<<<< HEAD
Welcome to the site
=======
Welcome to our new site
>>>>>>> feature/new-button

## Resolution Steps
1. Opened index.html in editor.
2. Decided to keep the new version: Welcome to our new site (from the feature branch).
3. Removed the markers and the old line.
4. Saved the file.
5. Staged the resolved file: git add index.html
6. Completed the merge: git commit (Git opened editor with default message, saved and closed).

## Result
The merge was successful. The final index.html contains:
Welcome to our new site

## Key Takeaway
Always read the conflict markers carefully and choose the correct version. If needed, you can combine parts from both branches