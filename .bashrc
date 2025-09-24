mkdir -p ~/bin

alias l="ls -lah --color=auto"
alias grep="grep --color=auto"
alias gs="git status"
alias gfp="git fetch && git pull"
alias start="./scripts/start.sh"
alias monitor="nvim logs/log.jsonl"
alias clip="xclip -selection clipboard"
alias synth="./scripts/synth.sh"
alias deploy="./scripts/deploy.sh"
alias sdklist="ls -1 ~/.sdkman/candidates/java"
alias dup="docker compose up -d"

# PATH Variables

export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="~/.npm-global/bin:$PATH"

# Environment Variables

export COMPOSE_BAKE=true

# Terminal prompt configuration with colors and Git repository info

RED=$'\e[0;31m'
GREEN=$'\e[1;32m'
YELLOW=$'\e[0;33m'
BLUE=$'\e[0;34m'
PURPLE=$'\e[1;35m'
CYAN=$'\e[0;36m'
WHITE=$'\e[0;37m'
NC=$'\e[0m'

git_info() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    repo=$(basename "$(git rev-parse --show-toplevel)" 2>/dev/null)
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if git rev-parse --abbrev-ref @{u} > /dev/null 2>&1; then
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

alias claude="/home/ryanf/.claude/local/claude"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export TEAMWEAVE="$HOME/workspace/teamweave"
export tw=$TEAMWEAVE

clear
