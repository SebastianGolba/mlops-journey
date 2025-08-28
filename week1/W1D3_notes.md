# Week 1 Day 3 — Processes, Jobs, Signals
Date: 2025-08-28

What I did
- Started a long-running process in the background and captured its PID (`sleep 600 &` + `echo $! > pid.txt`).
- Listed/inspected processes cleanly with `ps -o pid,ppid,tty,stat,etime,cmd -p <PID>` and `ps -ef | grep -E`.
- Practiced job control: suspend (Ctrl+Z), resume in background (`bg`), bring to foreground (`fg %N`), and `jobs -l`.
- Sent signals the right way: `kill -SIGTERM <PID>` first (polite), `kill -9 <PID>` only if needed. Confirmed exit with `ps -p <PID>`.
- Wrote `trap_demo.sh` that logs, creates a temp file, traps `SIGINT`/`SIGTERM`, runs `cleanup`, and exits with conventional codes (130/143).
- Practiced redirection (`>`, `>>`, `2>`, `2>&1`), piping to `tee`, and keeping a process alive with `nohup` + `disown`.

Commands I practiced
- `sleep 600 &` → `echo $! > pid.txt` — background a job and grab its PID
- `jobs -l` · `Ctrl+Z` · `bg` · `fg %N` — suspend, resume, foreground
- `ps -o pid,ppid,stat,etime,cmd -p $(cat pid.txt)` — clean single-process view
- `ps -ef | grep -E '[s]leep 600'` — full table + filter
- `kill -SIGTERM $(cat pid.txt)` → `kill -9 $(cat pid.txt)` — polite stop, then force if needed
- `chmod 700 trap_demo.sh` · `./trap_demo.sh` — user-only execute; run (Ctrl+C triggers trap)
- `./trap_demo.sh > all.log 2>&1 &` · `tail -n 10 all.log` — redirect + background; read last lines
- `./trap_demo.sh 2>&1 | tee live.log` — see output and save it
- `nohup ./trap_demo.sh > nohup.out 2>&1 & ; disown -h %1` — survive logout; detach job
- `pkill -f trap_demo.sh` — clean stop by matching command line

Gotchas
- Using `&;` after a command → **syntax error** (“unexpected token ‘;’”).
  Fix: `sleep 600 &` on one line, then `echo $! > pid.txt` on the next (or `sleep 600 & echo $! > pid.txt`).

