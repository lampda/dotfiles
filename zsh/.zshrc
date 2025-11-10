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
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
# Source - https://stackoverflow.com/a
# Posted by PythonNut, modified by community. See post 'Timeline' for change history
# Retrieved 2025-11-08, License - CC BY-SA 3.0
zstyle ':completion:*' matcher-list 'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}

lazygit-ctrl-g () {
	lazygit
}

open-vim-oil () {
  if [[ -z "$@" ]]; then
	if [[ -f "./Session.vim" ]]; then
	    nvim -S Session.vim -c 'lua vim.g.savesession = true' -c Oil
	else
	    nvim -c 'lua vim.g.savesession = true' -c Oil
	fi
	else
		nvim -c Oil "$@"
	fi
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

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

svim () {
  if [[ -z "$@" ]]; then
		if [[ -f "./Session.vim" ]]; then
				nvim -S Session.vim -c 'lua vim.g.savesession = true'
		else
				nvim -c 'lua vim.g.savesession = true'
		fi
			else
				nvim "$@"
	fi
}

yt () {
	yt-dlp $1 -o $2 -t mp4
}

zle -N fancy-ctrl-z
bindkey '^z' fancy-ctrl-z

zle -N lazygit-ctrl-g
bindkey '^g' lazygit-ctrl-g

zle -N y
bindkey '^y' y

zle -N open-vim-oil
bindkey '^e' open-vim-oil

autoload edit-command-line
zle -N edit-command-line
bindkey '^o' edit-command-line

eval "$(zoxide init zsh)" 
autoload -U colors && colors	
PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}%b"
alias cd=z
alias src="source  ~/.zshrc"
alias config="nvim ~/dotfiles/zsh/.zshrc"
alias s="kitten ssh"
alias vim=svim
