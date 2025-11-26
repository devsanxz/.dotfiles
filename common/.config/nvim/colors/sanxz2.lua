-- ~/.dotfiles/common/.config/nvim/colors/sanxz2.lua
-- TEMA: SANXZ 2.0 (High Contrast / Accessibility Edition)
-- Otimizado para Miopia/Astigmatismo/Fotofobia
-- Fundo: Preto Absoluto (#000000)
-- Texto: Ajustado para maior luminância (evita o "borrão" no fundo preto)

-- Reset básico
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "sanxz2"

-- ==========================================================
-- 1. A PALETA EXPANDIDA (Base + Bright)
-- ==========================================================
local p = {
	-- Âncoras
	black = "#000000", -- Fundo Absoluto (Zero emissão de luz)
	white = "#FFFFFF", -- Branco Puro

	-- Cores da UI (Levemente mais visíveis para orientar o olhar)
	ui_bg = "#160516", -- Fundo de menus (Um pouco mais claro que o preto)
	ui_border = "#551155", -- Bordas mais definidas
	ui_hover = "#330033", -- Seleção
	comment = "#CC8844", -- Ocre (Muito mais legível que o marrom antigo)

	-- PALETA CROMÁTICA (Base + 50% White Mix)

	-- 1. Violet (Texto Principal)
	violet = "#E066FF", -- Base (+5% luz)
	violet_b = "#EEAAFF", -- Bright (50% white) - Usado para Foco

	-- 2. Orange (Números/Constantes)
	orange = "#FFB266", -- Base (+5% luz)
	orange_b = "#FFD5AA", -- Bright (50% white)

	-- 3. Yellow (Funções)
	yellow = "#FFFF66", -- Base (+5% luz)
	yellow_b = "#FFFFAA", -- Bright (50% white)

	-- 4. Green (Strings)
	green = "#66FF66", -- Base (+5% luz)
	green_b = "#AAFFAA", -- Bright (50% white) - Strings suaves

	-- 5. Cyan (Tipos)
	cyan = "#66E0FF", -- Base (+5% luz)
	cyan_b = "#AAEEFF", -- Bright (50% white)

	-- 6. Blue (Operadores)
	blue = "#6666FF", -- Base (+5% luz)
	blue_b = "#AAAAFF", -- Bright (50% white)

	-- 7. Indigo (Estrutura/Keywords)
	indigo = "#AA66FF", -- Base (+5% luz)
	indigo_b = "#CCAAFF", -- Bright (50% white)

	-- 8. Red (Erros)
	red = "#FF6666", -- Base (+5% luz)
	red_b = "#FFAAAA", -- Bright (50% white)
}

-- ==========================================================
-- 2. FUNÇÃO DE HIGHLIGHT
-- ==========================================================
local function hl(group, fg, bg, attr)
	local opts = { fg = fg, bg = bg }
	if attr then
		opts[attr] = true
	end
	vim.api.nvim_set_hl(0, group, opts)
end

-- ==========================================================
-- 3. MAPEAMENTO ESTRATÉGICO
-- Estratégia: Usar versões "_b" (Bright) para leitura crítica
-- e versões base para estrutura, reduzindo a fadiga visual.
-- ==========================================================

-- --- Editor Base ---
hl("Normal", p.violet, p.black) -- Texto base mais claro
hl("NormalFloat", p.violet_b, p.ui_bg) -- Janelas flutuantes bem legíveis
hl("FloatBorder", p.indigo_b, p.ui_bg) -- Bordas claras definem bem o espaço
hl("ColorColumn", nil, p.ui_hover)
hl("Cursor", p.black, p.white)
hl("CursorLine", nil, p.ui_hover) -- Linha atual mais visível
hl("CursorLineNr", p.yellow_b, p.ui_hover, "bold")
hl("LineNr", p.ui_border, nil) -- Números apagados (foco no código)
hl("SignColumn", nil, p.black)

hl("VertSplit", p.ui_border, p.black)
hl("WinSeparator", p.ui_border, p.black)
hl("StatusLine", p.white, p.ui_bg)
hl("StatusLineNC", p.comment, p.ui_bg)

hl("Pmenu", p.violet_b, p.ui_bg) -- Menus claros
hl("PmenuSel", p.black, p.yellow_b) -- Seleção alto contraste
hl("PmenuSbar", nil, p.ui_bg)
hl("PmenuThumb", nil, p.indigo_b)

hl("Search", p.black, p.orange_b)
hl("IncSearch", p.black, p.yellow_b)
hl("Visual", nil, "#441144") -- Seleção Visual roxa escura

-- --- Sintaxe ---
-- Comentários: Clareados para evitar esforço ocular
hl("Comment", p.comment, nil, "italic")

-- Dados: Usamos as versões Bright (_b) para máxima legibilidade
hl("Constant", p.orange_b, nil)
hl("String", p.green_b, nil) -- Strings em tom pastel
hl("Character", p.green_b, nil)
hl("Number", p.orange_b, nil)
hl("Boolean", p.orange_b, nil, "bold")
hl("Float", p.orange_b, nil)

-- Identificadores: O mais branco possível para contraste
hl("Identifier", p.white, nil)
hl("Function", p.yellow_b, nil, "bold")

-- Estrutura: Usamos a base (um pouco mais saturada) para diferenciar dos dados
hl("Statement", p.indigo_b, nil)
hl("Conditional", p.indigo_b, nil)
hl("Repeat", p.indigo_b, nil)
hl("Label", p.cyan_b, nil)
hl("Operator", p.blue_b, nil)
hl("Keyword", p.indigo_b, nil, "italic")
hl("Exception", p.red_b, nil)

hl("PreProc", p.cyan, nil)
hl("Include", p.cyan, nil)
hl("Define", p.cyan, nil)
hl("Macro", p.cyan, nil)

hl("Type", p.cyan_b, nil)
hl("StorageClass", p.indigo_b, nil)
hl("Structure", p.cyan_b, nil)
hl("Typedef", p.cyan_b, nil)

hl("Special", p.blue_b, nil)
hl("Error", p.red_b, nil, "bold")
hl("Todo", p.black, p.red_b, "bold")

-- --- TreeSitter ---
hl("@variable", p.white, nil)
hl("@variable.builtin", p.orange_b, nil)
hl("@function", p.yellow_b, nil)
hl("@function.builtin", p.yellow_b, nil)
hl("@function.macro", p.cyan_b, nil)
hl("@keyword", p.indigo_b, nil, "italic")
hl("@keyword.function", p.indigo_b, nil, "bold")
hl("@operator", p.blue_b, nil)
hl("@string", p.green_b, nil)
hl("@type", p.cyan_b, nil)
hl("@type.builtin", p.cyan_b, nil)
hl("@constructor", p.yellow_b, nil)
hl("@punctuation", p.indigo, nil) -- Pontuação ligeiramente mais escura
hl("@tag", p.indigo_b, nil)
hl("@tag.attribute", p.yellow_b, nil)
hl("@tag.delimiter", p.ui_border, nil)

-- --- LSP & Diagnostics ---
hl("DiagnosticError", p.red_b, nil)
hl("DiagnosticWarn", p.yellow_b, nil)
hl("DiagnosticInfo", p.blue_b, nil)
hl("DiagnosticHint", p.cyan_b, nil)
hl("DiagnosticUnderlineError", nil, nil, "undercurl")

-- --- Plugins ---
-- Telescope
hl("TelescopeBorder", p.ui_border, p.black)
hl("TelescopePromptBorder", p.indigo_b, p.black)
hl("TelescopeTitle", p.indigo_b, p.black, "bold")

-- NvimTree
hl("NvimTreeNormal", p.violet, p.ui_bg)
hl("NvimTreeWinSeparator", p.ui_bg, p.ui_bg)
hl("NvimTreeFolderName", p.blue_b, nil)
hl("NvimTreeFolderIcon", p.indigo_b, nil)
hl("NvimTreeOpenedFolderName", p.white, nil, "bold")
