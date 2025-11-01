path+=('/home/marcig/go/bin') 
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Download Znap, if it's not there yet.
[[ -r ~/github/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/github/znap
source ~/github/znap/znap.zsh  # Start Znap

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
znap source zsh-completions
znap source zsh-syntax-highlighting
znap source zsh-async
znap source zsh-colored-man-pages
znap source zsh-abbrev-alias
znap source fzf-tab
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}

open-vim-oil () {
	nvim -c Oil
}

make-run () {
	make run
}

tatch () {
	tmux attach -t $1
}

kpop () {
	xclip -sel c
}

fe() {
local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && $EDITOR "${files[@]}"
}

zle -N fancy-ctrl-z
bindkey '^z' fancy-ctrl-z

zle -N open-vim-oil
bindkey '^e' open-vim-oil

autoload edit-command-line
zle -N edit-command-line
bindkey '^o' edit-command-line

eval "$(zoxide init zsh)" 
autoload -U colors && colors	
PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}%b"
alias cd=z
alias vim=nvim
alias src="source  ~/.zshrc"
alias config="nvim ~/dotfiles/zsh/.zshrc"
