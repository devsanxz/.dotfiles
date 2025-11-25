# ~/.zshrc

# --- Paleta de Cores Global (Aura Theme - True Color Hex) ---
# Usando os códigos hex exatos para 100% de fidelidade ao tema.

AURA_HEX_PURPLE='#a277ff'
AURA_HEX_GREEN='#61ffca'
AURA_HEX_ORANGE='#ffca85'
AURA_HEX_PINK='#f694ff'
AURA_HEX_BLUE='#82e2ff'
AURA_HEX_RED='#ff6767'
AURA_HEX_WHITE='#edecee'
AURA_HEX_GRAY='#6d6d6d'

# --- Fundo e Texto Principal ---
# Mantendo o fundo original profundo para máximo contraste geral
export background="#0F172A"
export foreground="#E2E8F0"  # Texto claro (ótimo contraste)

# --- A Correção de Miopia/Astigmatismo (Pretos mais claros) ---
# Clareados ~5-8% para não "sumirem" no fundo escuro.
# Removemos um pouco da saturação para evitar o tom "arroxeado/amarronzado".

# Antes: #1E293B -> Agora: Mais luminoso e neutro
export black="#334155"       

# Bright Black (Cinza médio para comentários/inativos)
# Antes: Indefinido/Escuro -> Agora: Visível sem esforço
export color8="#64748B"      

# --- Cores Vivas (Originais) ---
export red="#F43F5E"
export green="#22C55E"
export yellow="#FACC15"
export blue="#3B82F6"
export magenta="#A855F7"
export cyan="#22D3EE"
export white="#F1F5F9"

# --- Cores "Aura" (Brights) ---
# A mistura de 50% com branco para dobrar sua paleta (Tons Pastel)

export red_bright="#FAA0AF"     # Red + White
export green_bright="#91E2AE"   # Green + White
export yellow_bright="#FDE68A"  # Yellow + White
export blue_bright="#9CC0FB"    # Blue + White
export magenta_bright="#D4AAFB" # Magenta + White (Lilith Aura)
export cyan_bright="#91E9F6"    # Cyan + White

# --- Mapeamento ANSI Final ---
# 0-7: Cores Normais
export color0=$black
export color1=$red
export color2=$green
export color3=$yellow
export color4=$blue
export color5=$magenta
export color6=$cyan
export color7=$foreground

# 8-15: Cores Brilhantes (Pastel/Aura)
# color8 já foi definido lá em cima com o ajuste de contraste
export color9=$red_bright
export color10=$green_bright
export color11=$yellow_bright
export color12=$blue_bright
export color13=$magenta_bright
export color14=$cyan_bright
export color15=$white
