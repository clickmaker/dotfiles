alias s='git status'
alias b='git branch'
alias c='git checkout'
alias d='git diff'

if which tmux ; then
  SESSION_NAME=ope

  if [[ -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
    option=""
    if tmux has-session -t ${SESSION_NAME}; then
      option="attach -t ${SESSION_NAME}"
    else
      option="new -s ${SESSION_NAME}"
    fi
    tmux $option && exit
  fi
fi
