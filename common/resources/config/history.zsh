# --- Tamanho e Arquivo do Histórico ---

# Define o arquivo de histórico (padrão, mas bom garantir)
HISTFILE="$HOME/.zsh_history"

# 2^13 = 8192: A potência de 2 mais próxima de 10.000
export HISTSIZE=8192
export SAVEHIST=8192

# --- Configurações Extras de Otimização ---

# Se o histórico encher, remove os duplicados primeiro antes de apagar os antigos únicos
setopt HIST_EXPIRE_DUPS_FIRST

# Adiciona carimbo de data/hora no arquivo (útil para auditoria)
setopt EXTENDED_HISTORY

# Grava o comando no arquivo imediatamente, não espera o shell fechar
# (Essencial se você usa múltiplos terminais/tmux)
setopt INC_APPEND_HISTORY
