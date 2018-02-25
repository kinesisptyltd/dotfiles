#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source base16 256 colourspace script.
if [[ -s "$HOME/.colours/base16-shell/scripts/base16-tomorrow-night.sh" ]]; then
  source "$HOME/.colours/base16-shell/scripts/base16-tomorrow-night.sh"
fi

# Load direnv
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

# Setup docker environment variables docker-machine
if which docker-machine > /dev/null; then
  eval "$(docker-machine env default)";
fi

if  [[ -f /usr/local/etc/profile.d/z.sh ]]; then
  . /usr/local/etc/profile.d/z.sh
fi

# Aliases
unalias gb
alias a='tmux attach -t'
alias g='git'
alias v='nvim'
alias n='nvim'
alias t='tmux'
alias c='cd'
alias s='spring'
alias u='mr -j10 update'
alias be='bundle exec'
alias psql.server='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'
alias gt='go test -v -cover $(go list ./... | grep -v vendor)'
alias mux='tmuxinator'
source <(kubectl completion zsh)
source <(minikube completion zsh)
