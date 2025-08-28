set -euo pipefail
log() { printf "%s | %s\n" "$(date +%T)" "$*"; }
cleanup() {
  log "cleanup: removing temp files"
  rm -f "tmp.$$" || true
  log "cleanup: done"
}

trap 'log "got SIGINT";  cleanup; exit 130' INT
trap 'log "got SIGTERM"; cleanup; exit 143' TERM

log "start (pid=$$)"
echo "temp" > "tmp.$$"

i=0
while :; do
  i=$((i+1))
  log "tick $i"
  sleep 2          
done
