# Docker Compose abbreviations, replacing demartini/dc.fish (its functions called
# the retired `docker-compose` v1 binary). The completion pager shows the expansion:
#   dcps  Abbreviation: docker compose ps
status is-interactive; or return

set -l dccmd "docker compose"
if command -q docker-compose; and not docker compose version >/dev/null 2>&1
    set dccmd docker-compose
end

abbr -a -g dco      "$dccmd"
abbr -a -g dcb      "$dccmd build"
abbr -a -g dccg     "$dccmd config"
abbr -a -g dcdown   "$dccmd down"
abbr -a -g dce      "$dccmd exec"
abbr -a -g dcev     "$dccmd events"
abbr -a -g dch      "$dccmd help"
abbr -a -g dci      "$dccmd images"
abbr -a -g dck      "$dccmd kill"
abbr -a -g dcl      "$dccmd logs"
abbr -a -g dclf     "$dccmd logs -f"
abbr -a -g dclF     "$dccmd logs -f --tail 0"
abbr -a -g dcp      "$dccmd pause"
abbr -a -g dcport   "$dccmd port"
abbr -a -g dcps     "$dccmd ps"
abbr -a -g dcpull   "$dccmd pull"
abbr -a -g dcpush   "$dccmd push"
abbr -a -g dcrm     "$dccmd rm"
abbr -a -g dcrstart "$dccmd restart"
abbr -a -g dcrun    "$dccmd run"
abbr -a -g dcstart  "$dccmd start"
abbr -a -g dcstop   "$dccmd stop"
abbr -a -g dctop    "$dccmd top"
abbr -a -g dcunp    "$dccmd unpause"
abbr -a -g dcup     "$dccmd up"
abbr -a -g dcupb    "$dccmd up --build"
abbr -a -g dcupd    "$dccmd up -d"
abbr -a -g dcupdb   "$dccmd up -d --build"
abbr -a -g dcv      "$dccmd version"

# Not compose: dc.fish also shipped this global prune.
abbr -a -g dcprune 'docker system prune --all --volumes --force'
