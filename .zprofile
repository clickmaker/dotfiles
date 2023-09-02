alias change_profile='(){echo -e "\033]1337;SetProfile=$1\a"}'

if [ "$(uname -m)" = "arm64" ]; then
  # arm64
  change_profile ARM
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH="/opt/homebrew/bin:$PATH"

  export ANYENV_ROOT="$HOME/.anyenv_arm64"
  eval "$(anyenv init -)"

  export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
  export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
  export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

  export GOBIN=$HOME/bin
  export PATH="$GOBIN:$PATH"

  #export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
  #export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"
else
  # x86_64
  change_profile Intel
  eval "$(/usr/local/bin/brew shellenv)"

  export ANYENV_ROOT="$HOME/.anyenv_x64"
  eval "$(anyenv init -)"

  export PATH="$HOME/.anyenv_x64/envs/rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  export PATH="$HOME/.anyenv_x64/envs/nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi

# PATH 重複を削除
export PATH=$(printf %s "$PATH" | awk -v RS=: -v ORS=: '!arr[$0]++')
