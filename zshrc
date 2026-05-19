#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Lines configured by zsh-newuser-install    
HISTFILE=~/.histfile                         
HISTSIZE=1000                                
SAVEHIST=1000                                
bindkey -v                                   

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Disable ssh hosts file
zstyle ':completion:*:ssh:*' hosts off

# Speed up ssh host completion
zstyle ':completion:*:(ssh|scp|rsync):*' tag-order '!hosts:-host:host !hosts:-domain:domain !hosts:-ipaddr:ip\ address *'

# Fix numberpad key binds
# Translate numpad keys to their twin counterparts.
() {
  local keymap
  for keymap in emacs viins vicmd; do
    bindkey -M $keymap -s '^[OM' '^M'  # enter
    bindkey -M $keymap -s '^[Om' '-'
    bindkey -M $keymap -s '^[Oj' '*'
    bindkey -M $keymap -s '^[Oo' '/'
    bindkey -M $keymap -s '^[OX' '='

    bindkey -M $keymap -s '^[Ol' '+'
    bindkey -M $keymap -s '^[Ow' '7'
    bindkey -M $keymap -s '^[Ox' '8'
    bindkey -M $keymap -s '^[Oy' '9'
    bindkey -M $keymap -s '^[Ot' '4'
    bindkey -M $keymap -s '^[Ou' '5'
    bindkey -M $keymap -s '^[Ov' '6'
    bindkey -M $keymap -s '^[Oq' '1'
    bindkey -M $keymap -s '^[Or' '2'
    bindkey -M $keymap -s '^[Os' '3'
    bindkey -M $keymap -s '^[Op' '0'
    bindkey -M $keymap -s '^[On' '.'
  done
}

# include local config
if [[ -d ~/.zshrc.d ]]
then
	for rc in ~/.zshrc.d/*
	do	
		if [[ -f "$rc" ]]
		then
			source "$rc"
		fi
	done
fi
unset rc

# Created by `pipx` on 2025-11-24 02:56:25
export PATH="$PATH:/home/gandalf/.local/bin"
export PATH="$HOME/.npm-global/bin:$PATH"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

# OpenClaw Completion
source "/home/gandalf/.openclaw/completions/openclaw.zsh"

# Playwright Fedora wrapper (https://github.com/CybLow/playwright-fedora)
if [ -f "$HOME/.local/share/playwright-fedora/pw.bash" ]; then
    source "$HOME/.local/share/playwright-fedora/pw.bash"
fi

# Added by LM Studio CLI tool (lms)
export PATH="$PATH:/home/gandalf/.lmstudio/bin"

# Added by me
export PATH="$PATH:/opt/metasploit-framework/bin/"

# Added by me
eval "$(starship init zsh)"
