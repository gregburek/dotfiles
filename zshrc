#. ~/.zsh/config
#. ~/.zsh/completion
. ~/.zsh/oh-my-zshrc
. ~/.zsh/aliases

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by travis gem
#[ -f /Users/gburek/.travis/travis.sh ] && source /Users/gburek/.travis/travis.sh

export NVM_DIR="/Users/gburek/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/gburek/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/gburek/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/gburek/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/gburek/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
