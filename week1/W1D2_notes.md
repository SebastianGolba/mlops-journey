# Week 1 Day 2 — Permissions, Ownership, umask
Date: 2025-08-27

What I did
- Read and changed file permissions with `chmod` (numeric + symbolic).
- Set directory permissions correctly (why the `x` bit matters on dirs).
- Demonstrated ownership using a second user via `/tmp` (avoids traverse issues).
- Used `umask` to control defaults for new files/dirs.
- Wrote and ran a self-test script to assert `600` (file) and `700` (dir).
- Committed notes and pushed.

Commands I practiced
ls -l (long list), ls -ld <dir> (list the directory entry), 
chmod 600 <file> (private file), chmod 700 <dir> (private dir),
chmod u+x|u-x <file> (toggle user execute only),
chown <user>:<group> <path> (change owner+group),
umask, umask 0077, umask 0022 (default perms for new items),
stat -c "%a" <path> (numeric mode; -c = format, "%a" = perms),
su - <user> (login shell as that user),
echo "text" > <file> (create/overwrite),
chmod u+x permissions_check.sh (make script executable)

Gotchas
- Switching to `testuser` and cd’ing into my repo failed with “Permission denied”.
  Cause: parent dirs lacked execute (`x`) for others; couldn’t traverse.
  Fix: copied demo file to `/tmp` and `chown testuser:testuser /tmp/secret.txt`.

- Forgot to lock down who can run the script
  Cause: you did chmod +x (gives execute to everyone in some shells).
  Fix: use u+x to only give execute to user
