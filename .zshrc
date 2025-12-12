# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [[ "$(uname)" == "Darwin" ]]; then
	# have a little Apple in the PS1 on macOS
	ZSH_THEME="apple"
fi
# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode disabled # just remind me to update when it's time
COMPLETION_WAITING_DOTS="true"
plugins=(colorize sublime zsh-nvm )
DISABLE_AUTO_UPDATE=true
DISABLE_UNTRACKED_FILES_DIRTY="true"
source $ZSH/oh-my-zsh.sh
## end of omz init ##

alias slt=st # sublime text
tw () { streamlink twitch.tv/$@ best --player mpv;} # twitch viewer
alias dtiso='node -e "console.log(new Date().toISOString())"' # print iso date
alias dt=dtiso
alias vim=nvim
alias minify='node -e "console.log(JSON.stringify(JSON.parse(require(\"fs\").readFileSync(0,\"utf-8\"))));"'


if [[ "$(uname)" == "Darwin" ]]; then
	# macOS specific
	alias iclddrv='cd /Users/djs/Library/Mobile Documents/com~apple~CloudDocs'
	pbjq() { pbpaste|jq; }
	export PATH="$(brew --prefix)/opt/python@3.11/libexec/bin:$PATH"
	export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
fi

# ffprobe json output
ffprobej() { ffprobe -v quiet -print_format json -show_format -show_streams $@ |jq;} 

# adb screenshot to current date.png
adbscrot() { 
        FILENAME="adb_$(date +"%Y-%m-%d_%H-%M-%S").png"
        adb exec-out screncap -p > "$FILENAME"
        echo "$FILENAME"
}

# create or use python venv in current folder
venv() {
  local dir="${1:-.}"
  local venv_path="$dir/.venv"

  if [[ ! -d "$venv_path"  ]]; then
      echo "No venv found in $venv_path — creating..."
      python3.12 -m venv "$venv_path" || return 1
  fi

  echo "Activating $venv_path"
  source "$venv_path/bin/activate"
}

alias AEMU=$ANDROID_SDK_HOME/emulator/emulator

source <(fzf --zsh)
export ANSIBLE_HOST_KEY_CHECKING=False

# default to node 20
nvm use 20 >/dev/null

# cd = zoxide
eval "$(zoxide init zsh --cmd cd)"

