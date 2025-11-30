-- ~/.config/nvim/colors/sanxzcoolwarm.lua
-- TEMA: SANXZ COOL/WARM (Inversão: Frio para Ação, Quente para Estrutura)
-- Usa a Paleta Base SANXZ de 16 cores.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
end

vim.g.colors_name = "sanxzcoolwarm"
vim.opt.termguicolors = true

-- ==========================================================
-- 1. A PALETA (SANXZ Pure 16-Color Palette)
-- ==========================================================
local c = {
        -- Neutros
        black = "#000000",
        white = "#FFFFFF",

        -- Cores Base (Saturadas)
        red_base = "#FF0000",
        orange_base = "#FF8000",
        yellow_base = "#FFFF00",
        green_base = "#00FF00",
        cyan_base = "#00FFFF",
        blue_base = "#0000FF",
        violet_base = "#8000FF",

        -- Cores Brilhantes
        red_brilliant = "#FF5555",
        orange_brilliant = "#FFAA55",
        yellow_brilliant = "#FFFF77",
        green_brilliant = "#55FF55",
        cyan_brilliant = "#55FFFF",
        blue_brilliant = "#5555FF",
        violet_brilliant = "#AA55FF",

        -- Especiais (UI)
        ui_bg = "#000000",
        ui_border = "#331111", -- Borda avermelhada (quente)
        ui_hover = "#221111", -- Hover avermelhado (quente)
        comment = "#AA5522", -- Comentário Laranja Queimado (Quente)

        none = "NONE",
}

-- ==========================================================
-- 2. FUNÇÃO DE HIGHLIGHT
-- ==========================================================
local function hl(group, fg, bg, attr)
        local opts = {}
        if fg then opts.fg = fg end
        if bg then opts.bg = bg end
        if attr then opts[attr] = true end
        vim.api.nvim_set_hl(0, group, opts)
end

-- ==========================================================
-- 3. MAPEAMENTO INVERTIDO (Frio=Ação, Quente=Estrutura)
-- ==========================================================

-- --- Editor Base ---
hl("Normal", c.violet_brilliant, c.black)
hl("NormalFloat", c.white, c.ui_bg)
hl("SignColumn", nil, c.ui_bg)

hl("LineNr", c.comment, nil)
hl("CursorLine", nil, c.ui_hover)
hl("CursorLineNr", c.cyan_brilliant, nil, "bold") -- Destaque Frio (Ação)
hl("EndOfBuffer", c.ui_bg, nil)

-- --- Sintaxe (A Inversão) ---
hl("Comment", c.comment, nil, "italic") -- Quente

-- AÇÃO/DADOS -> FRIO (Azul, Ciano, Verde, Violeta)
hl("String", c.cyan_brilliant) -- Dado -> Frio
hl("Character", c.cyan_brilliant)

hl("Number", c.blue_brilliant) -- Dado -> Frio
hl("Boolean", c.blue_brilliant)
hl("Float", c.blue_brilliant)

hl("Function", c.green_brilliant, nil, "bold") -- Ação -> Frio
hl("Constant", c.violet_brilliant) -- Dado -> Frio

-- ESTRUTURA -> QUENTE (Laranja, Amarelo, Vermelho)
hl("Keyword", c.orange_brilliant) -- Estrutura -> Quente
hl("Conditional", c.orange_brilliant)
hl("Repeat", c.orange_brilliant)
hl("Statement", c.orange_brilliant)

hl("PreProc", c.yellow_brilliant) -- Estrutura -> Quente
hl("Include", c.yellow_brilliant)
hl("Define", c.yellow_brilliant)
hl("Macro", c.yellow_brilliant)

hl("Type", c.yellow_brilliant) -- Estrutura -> Quente
hl("Operator", c.red_brilliant) -- Conector -> Quente
hl("Special", c.red_brilliant) -- Especial -> Quente

hl("Identifier", c.white) -- Neutro

-- --- Interface ---
hl("Search", c.black, c.cyan_brilliant) -- Busca (Ação) -> Frio
hl("Visual", nil, c.ui_hover)
hl("MatchParen", c.white, c.ui_border, "bold")

-- Semântica Crítica (Mantida por segurança ou invertida?)
-- Mantendo Erro Vermelho por segurança, mas Warning pode ser Violeta
hl("Error", c.red_brilliant, nil, "bold")
hl("ErrorMsg", c.red_brilliant, nil, "bold")
hl("WarningMsg", c.violet_brilliant, nil, "bold") -- Warning -> Frio
hl("DiagnosticInfo", c.blue_brilliant) -- Info -> Frio
hl("DiagnosticHint", c.white)

-- --- Menus ---
hl("Pmenu", c.white, c.ui_border)
hl("PmenuSel", c.ui_bg, c.orange_brilliant) -- Seleção (Estrutura ativa) -> Quente
