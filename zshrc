#. ~/.zsh/config
#. ~/.zsh/completion
. ~/.zsh/oh-my-zshrc
. ~/.zsh/aliases

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
