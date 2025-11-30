# Fix Keybindings for Zsh
# Garante modo Emacs (digitação padrão)
bindkey -e

# Teclas Básicas (baseado no terminfo para compatibilidade)
# Usa strings literais se terminfo falhar, ou terminfo direto
# Home/End
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# Delete
bindkey "^[[3~" delete-char

# Ctrl+Setas (Pular palavras)
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Histórico Inteligente
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
