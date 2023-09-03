# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 環境変数
export LANG=ja_JP.UTF-8

# 補完
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit -u
fi
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## 日本語ファイルを扱えるようにする
setopt print_eight_bit
# function _ssh {
#   compadd `fgrep 'Host '$HOME/.ssh/config | awk '{print $2}' | sort`;
# }
_cache_hosts=(`ruby -ne 'if /^Host\s+(.+)$/; print $1.strip, "\n"; end' ~/.ssh/config`) # ssh,scp用ホスト追加
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''
setopt list_packed           # 補完候補を詰めて表示
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt list_types            # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完
setopt auto_param_keys       # カッコの対応などを自動的に補完
setopt magic_equal_subst     # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt complete_in_word      # 語の途中でもカーソル位置で補完
setopt extended_glob         # 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)

# 履歴
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
##  直前の重複を記録しない
setopt hist_ignore_dups

# エイリアス
alias a='git add '
alias b='git branch '
alias c='git checkout '
alias d='git diff '
alias e='vim '
alias f='find . '
alias g='grep -rIin '
alias l='ls -la '
alias s='git status '
alias shell='exec $SHELL -l'

alias dc='docker compose '
alias dcu='(cd dockerdev && docker compose up -d) || docker compose up -d'
alias dcd='docker compose down'
alias dcr='docker compose run --rm runner '
alias dcrst='docker compose restart'
alias dcbe='docker compose run --rm runner bundle exec '
alias dcbi='docker compose run --rm runner bundle install '

function simple-notify {
  osascript -e "display notification \"${2:-has done.}\" with title \"${1:-something}\" sound name \"default\""
}

# p10k
# ZI plugin manager
zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k

ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(direnv hook zsh)"

source "${HOME}/.env"
