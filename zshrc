ZSH_HIGHLIGHT_MAXLENGTH=100
HISTSIZE=1000
SAVEHIST=1000
#. ~/.zsh/config
#. ~/.zsh/completion
. ~/.zsh/oh-my-zshrc
. ~/.zsh/aliases

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
