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
alias mux='tmuxinator'
alias c='cd'
alias s='spring'
alias u='mr -j10 update'
alias be='bundle exec'
alias psql.server='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'
alias gt='go test -v -cover $(go list ./... | grep -v vendor)'
alias grul='g ru && g l'
alias grus='g ru && g s'
alias npmbower='npm cache clean && bower cache clean && npm install && bower install'
alias reinstalldep='rm -rf node_modules bower_components dist tmp && npmbower'
alias rt='be rspec spec && be rubocop -R -a'
alias lsaws-s='cd ~/Code/chef-repo/ && rake aws:instances && cd -'
alias lsaws-p='cd ~/Code/chef-repo/ && ENVIRONMENT=production rake aws:instances && cd -'

alias gdeletebranch='f() { g branch -d $1 && g push -d origin $1 };f'

alias ms='mux start'
alias ms-bouncer='ssh-add ~/.ssh/work.key && ms bouncer'
alias ms-iw='ms integrated-web'
alias ms-id='ms integrated-data'
alias ms-ie2e='ms integrated-e2e-tests'
alias ms-cw='ms city-web'
alias ms-cd='ms city-data'
alias ms-ce2e='ms city-e2e-tests'
alias ms-pw='ms precinct-web'
alias ms-pd='ms precinct-data'
alias ms-deploy='ms deploy'
alias tks='tmux kill-session'
alias setup_tests='be rake db:test:prepare && be rake db:seed RAILS_ENV=test'

alias k='kubectl'
alias kubeconfig='f() { export KUBECONFIG=~/Code/kube-config/sydney-$1.config };f'
alias kconfig='kubeconfig'

alias ggwp='killall ember ruby caddy "foreman: master"; tmux kill-server'

# Functions
repl() { perl -pi -w -e "s/$1/$2/g;" * }
replr() { perl -p -i -e "s/$1/$2/g" `grep -ril $1 *` }

source <(kubectl completion zsh)
source <(minikube completion zsh)
