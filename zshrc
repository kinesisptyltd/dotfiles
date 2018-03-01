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

# Python (Pipenv)
export WORKON_HOME=~/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export PYENV_ROOT=~/.pyenv

eval "$(pyenv init -)"

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
alias be='bundle exec'
alias psql.server='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'
alias mux='tmuxinator'
source <(kubectl completion zsh)
source <(minikube completion zsh)

alias addkey='ssh-add ~/.ssh/id_rsa'
alias s='spring'
alias be='bundle exec'
alias bx='bundle exec'

alias gru='git remote update'
alias rt='be rubocop -R -a && be rspec spec'
alias noff='be rspec spec --no-fail-fast'
alias rp='be rake precommit'
alias et='ember test'
alias prep_asset_test='be rake db:purge RAILS_ENV=test && be rake db:test:clone_structure && be rake db:seed RAILS_ENV=test'
alias grul='gru && g l'
alias gpom='git push origin master'
alias grpo='git remote prune origin'
alias setup_tests='be rake db:test:prepare && be rake db:seed RAILS_ENV=test'
alias emberupdate='bower cache clean && npm cache clean && rm -rf bower_components node_modules dist tmp && bower install && yarn install'
alias kpg='rm /usr/local/var/postgres/postmaster.pid'
alias tks='tmux kill-session'
alias tkst='tmux kill-session -t'

alias pa='echo Updating Bouncer... && \
          cd ~/Code/bouncer/ && gfr && \
          echo Updating City Data... && \
          cd ~/Code/city-data/ && gfr && \
          echo Updating City Web... && \
          cd ~/Code/city-web/ && gfr && \
          echo Updating Integrated Data... && \
          cd ~/Code/integrated-data/ && gfr && \
          echo Updating Integrated Web... && \
          cd ~/Code/integrated-web/ && gfr && \
          echo Updating Deploy... && \
          cd ~/Code/deploy/ && gfr && \
          cd ~ && \
          echo Done!'

alias ms='mux start'

bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey "^w" backward-kill-word

alias rdbmast='be rake db:migrate && be rake db:test:prepare && be rake db:seed RAILS_ENV=test'
alias yif='yarn install --force'

alias dq='f() { curl -X "POST" -H "Content-Type:application/json" -d @$1 "http://localhost:8082/druid/v2/?pretty" };f'
alias di='f() { curl -X "POST" -H "Content-Type:application/json" -d @$1 "http://localhost:8090/druid/indexer/v1/task" };f'
alias dk='f() { curl -X "DELETE" "localhost:8081/druid/coordinator/v1/datasources/$1" && curl -X "POST" -H "Content-Type:application/json" -d "{ \"type\":\"kill\", \"id\":\"kill_task-`date +%s`-$1\",\"dataSource\":\"$1\", \"interval\":\"2010-01-01T00:00:00Z/2019-01-01T00:00:00Z\" }" localhost:8090/druid/indexer/v1/task };f'
alias md='/Users/David/Code/treadmill/tooling/metadata'
