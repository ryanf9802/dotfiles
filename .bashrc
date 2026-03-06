mkdir -p ~/bin

# fs commands
alias l="eza -lah --icons"
alias ls="eza -lah --total-size --icons"
alias grep="grep --color=auto"

# git commands
alias gs="git status"
alias gfp="git fetch && git pull"
alias gb="git branch"
gbclean() {
  git fetch --prune
  git branch -vv | awk '/: gone]/{print $1}' | xargs -r git branch -d
}

alias clip="xclip -selection clipboard"

# PATH Variables

export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$HOME/.npm-global/bin:$PATH"

# Environment Variables

export COMPOSE_BAKE=true

# Terminal prompt configuration with colors and Git repository info

GREEN=$'\e[1;32m'
PURPLE=$'\e[1;35m'
CYAN=$'\e[0;36m'
NC=$'\e[0m'

git_info() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    repo=$(basename "$(git rev-parse --show-toplevel)" 2>/dev/null)
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if git rev-parse --abbrev-ref @{u} >/dev/null 2>&1; then
      ahead=$(git rev-list --count @{u}..HEAD 2>/dev/null)
    else
      ahead=0
    fi
    echo "${PURPLE}[${repo} | ${branch} | ${ahead}]${NC} "
  fi
}

export PS1="\[${GREEN}\]\u@\h\[${NC}\]:\[${CYAN}\]\w\[${NC}\] \$(git_info)\n> "

if [[ $PWD == /mnt/* ]]; then
  cd "$HOME" || exit 1
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export TEAMWEAVE="$HOME/workspace/teamweave"
export tw=$TEAMWEAVE

. "$HOME/.local/bin/env"

# pnpm
export PNPM_HOME="/home/ryanf/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

clear
