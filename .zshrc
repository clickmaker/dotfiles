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
  compinit
fi
## 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## 日本語ファイルを扱えるようにする
setopt print_eight_bit

# 履歴
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
##  直前の重複を記録しない
setopt hist_ignore_dups

# エイリアス
alias e='vim '
alias ll='ls -la '
alias a='git add '
alias s='git status '
alias b='git branch '
alias c='git checkout '
alias d='git diff '
alias dc='docker-compose '
alias dcr='docker-compose run --rm runner '
alias dcrst='docker-compose restart'
alias dcbe='docker-compose run --rm runner bundle exec '

# p10k
# ZI plugin manager
zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k

ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
