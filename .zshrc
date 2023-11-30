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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

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
export PATH="$HOME/bin:$PATH"
