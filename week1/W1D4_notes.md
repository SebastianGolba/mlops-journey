# Week 1 Day 4 — Git branching, merges, conflicts, rebase, stash, reset
Date: 2025-08-29

What I did
- Built two feature branches from main, intentionally edited the same line, and resolved a merge conflict.
- Visualized history with `git log --oneline --graph --decorate --all` (and made `git lg` alias).
- Cleaned a noisy feature with `git rebase -i` (squash/fixup + reword), then `--ff-only` merged it.
- Practiced `git stash push -u -m`, `stash list/show -p`, `stash pop/apply/drop`.
- Recovered from a bad commit using `git reset --soft` (with a safety backup branch).

Commands I practiced
git switch -c <branch>, git merge --no-ff <branch> -m "<msg>",
git log --oneline --graph --decorate --all (-n 20), git config --global alias.lg "...",
git rebase -i <base> (pick/reword/squash/fixup),
git stash push -u -m "<msg>" · stash list · stash show -p · stash pop/apply/drop,
git reset --soft HEAD~1 (and when to consider --hard),
git add/commit/status, sed -n to view conflict markers

Gotchas
- Nested `git init` in subfolders creates headaches. Work in the main repo only.
- Conflict markers `<<<<<<<`/`=======`/`>>>>>>>` must be removed by hand; stage resolved files before committing the merge.
- Rebase/Reset rewrite history—don’t `push --force` on a shared branch. Use `--force-with-lease` if you must, and coordinate.
- `stash` without `-u` ignores untracked files—add `-u` to grab them.
