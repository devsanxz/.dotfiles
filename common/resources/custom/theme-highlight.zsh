# ~/.config/zsh/plugins.zsh (ou theme-highlight.zsh)
# Configuração de Estilos para zsh-syntax-highlighting usando Hex Codes diretos.

typeset -A ZSH_HIGHLIGHT_STYLES

# Comandos e Funções (Sua Identidade - Magenta)
ZSH_HIGHLIGHT_STYLES[command]="fg=#A855F7,bold"
ZSH_HIGHLIGHT_STYLES[alias]="fg=#A855F7,bold"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=#A855F7,bold"
ZSH_HIGHLIGHT_STYLES[function]="fg=#A855F7,bold"

# Caminhos e Arquivos (Azul - Igual ao ls-colors)
ZSH_HIGHLIGHT_STYLES[path]="fg=#3B82F6"

# Strings e Texto Citado (Verde - Código Seguro)
ZSH_HIGHLIGHT_STYLES[string]="fg=#22C55E"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=#22C55E"

# Variáveis e Opções (Amarelo - Atenção)
ZSH_HIGHLIGHT_STYLES[variable]="fg=#FACC15"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=#FACC15"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=#FACC15"

# Erros e Desconhecidos (Vermelho)
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#F43F5E,bold"

# Padrão (Foreground Suave - Sem Branco Estourado)
ZSH_HIGHLIGHT_STYLES[default]="fg=#E2E8F0"
