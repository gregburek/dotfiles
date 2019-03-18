ZSH_HIGHLIGHT_MAXLENGTH=100
HISTSIZE=1000
SAVEHIST=1000
#. ~/.zsh/config
#. ~/.zsh/completion
. ~/.zsh/oh-my-zshrc
. ~/.zsh/aliases

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# added by travis gem
[ -f /Users/gburek/.travis/travis.sh ] && source /Users/gburek/.travis/travis.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
        ### Mac cursor commands for iTerm2; map ctrl+arrows or alt+arrows to fast-move
        bindkey -e
        bindkey '^[[1;9C' forward-word
        bindkey '^[[1;9D' backward-word
        bindkey '\e\e[D' backward-word
        bindkey '\e\e[C' forward-word
fi