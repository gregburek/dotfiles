ZSH_HIGHLIGHT_MAXLENGTH=100
HISTSIZE=1000
SAVEHIST=1000
#. ~/.zsh/config
#. ~/.zsh/completion
if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi
. ~/.zsh/oh-my-zshrc
. ~/.zsh/aliases

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

if [[ "$OSTYPE" == "darwin"* ]]; then
        ### Mac cursor commands for iTerm2; map ctrl+arrows or alt+arrows to fast-move
        bindkey -e
        bindkey '^[[1;9C' forward-word
        bindkey '^[[1;9D' backward-word
        bindkey '\e\e[D' backward-word
        bindkey '\e\e[C' forward-word
fi

FD_OPTIONS="--follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less —f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export F2F_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export BAT_PAGER="less -R"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/usr/local/sbin:$PATH"
