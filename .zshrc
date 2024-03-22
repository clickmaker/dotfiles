# envs
export LANG=ja_JP.UTF-8
source "${HOME}/.env"
eval "$(direnv hook zsh)"

# zplug
source ~/.zplug/init.zsh
# theme
zplug romkatv/powerlevel10k, as:theme, depth:1
# completions
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
# load
zplug load # --verbose
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000

# alias
if [ -e "$HOME/.alias" ]
then
    source "$HOME/.alias"
fi

# anyenv
if [ -e "$HOME/.anyenv" ]
then
    export ANYENV_ROOT="$HOME/.anyenv"
    export PATH="$ANYENV_ROOT/bin:$PATH"
    if command -v anyenv 1>/dev/null 2>&1
    then
        eval "$(anyenv init -)"
    fi
fi

# path
# export PATH="$HOME/bin:$PATH"

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
