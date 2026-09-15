# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

export QT_QPA_PLATFORMTHEME=qt6ct
export QT_STYLE_OVERRIDE=kvantum

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY





#---Zsh system
fpath+=/usr/share/zsh/site-functions
autoload -Uz compinit
compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/orhan/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/orhan/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/orhan/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/orhan/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# --- POWERLEVEL10K ---
# If you installed via dnf, use this path:
source ~/.powerlevel10k/powerlevel10k.zsh-theme
# If you installed via git, comment out the line above and uncomment this one:
# source ~/.powerlevel10k/powerlevel10k.zsh-theme

#Plugins 
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#color command
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLES='#888888'
ZSH_HIGHLIGHT_STYLES[command]='fg=#228B22,bold'
ZSH_HIGHLIGHT_STYLES[unknown-command]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Created by `pipx` on 2026-09-12 15:47:15
export PATH="$PATH:/home/orhan/.local/bin"
