-- ~/.config/nvim/colors/sanxzmonored.lua
-- TEMA: SANXZ MONORED (Fork do SANXZ4, focado em tons de vermelho)
-- Mantém cores semânticas (verde, amarelo, vermelho)
-- Todas as outras cores são tons de vermelho.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
end

vim.g.colors_name = "sanxzmonored"
vim.opt.termguicolors = true

-- ==========================================================
-- 1. A PALETA (Fonte da Verdade - SSOT) - Monocromático Vermelho
-- ==========================================================
local c = {
        -- Âncoras
        black = "#000000", -- Base preta
        c_white = "#FFCCCC", -- Vermelho muito claro, quase rosa (substituindo o branco)

        -- Ciclo Arco-Íris (agora tons de vermelho/mantidos)
        violet = "#FF5555", -- c1 (Foreground Principal - Vermelho Vibrante)
        orange = "#FF8888", -- c2 (Vermelho Alaranjado - Números/Constantes)
        yellow = "#FFFF55", -- c3 (Amarelo - MANTIDO para Funções/Warnings)
        green = "#55FF55", -- c4 (Verde - MANTIDO para Strings/Sucesso)
        cyan = "#CC3333", -- c5 (Vermelho Escuro - Tipos/Info)
        blue = "#AA0000", -- c6 (Vermelho Profundo - Operadores)
        indigo = "#EE0000", -- c7 (Vermelho Intenso - Keywords/Estrutura)
        c_red = "#FF0000", -- c8_red (Vermelho Puro - MANTIDO para Erros/Alertas)

        -- Interface (UI)
        ui_bg = "#1A0000", -- Fundo de menus/status (Vermelho muito escuro, quase preto)
        ui_border = "#440000", -- Bordas sutis (Vermelho escuro)
        ui_hover = "#660000", -- Seleção/CursorLine (Vermelho médio-escuro)
        comment = "#884444", -- Comentários (Vermelho acinzentado/marrom avermelhado)

        -- Especiais
        none = "NONE",
}

-- ==========================================================
-- 2. FUNÇÃO DE HIGHLIGHT (Inalterada)
-- ==========================================================
local function hl(group, fg, bg, attr)
        local opts = {}
        if fg then
                opts.fg = fg
        end
        if bg then
                opts.bg = bg
        end
        if attr then
                opts[attr] = true
        end
        vim.api.nvim_set_hl(0, group, opts)
end

-- ==========================================================
-- 3. MAPEAMENTO DE GRUPOS (Lógica Unificada) - Adaptado para Monored
-- ==========================================================

-- --- Editor Base ---
hl("Normal", c.violet, c.ui_bg)
hl("NormalFloat", c.violet, c.ui_bg)
hl("SignColumn", nil, c.ui_bg)

hl("LineNr", c.ui_border, nil)
hl("CursorLine", nil, c.ui_hover)
hl("CursorLineNr", c.orange, nil, "bold") -- Mantido como laranja para destaque de linha
hl("EndOfBuffer", c.ui_bg, nil)

-- --- Sintaxe ---
hl("Comment", c.comment, nil, "italic")

hl("String", c.green) -- Mantido verde
hl("Character", c.green)

hl("Number", c.orange)
hl("Boolean", c.orange)
hl("Float", c.orange)

hl("Function", c.yellow, nil, "bold") -- Mantido amarelo
hl("Keyword", c.indigo)
hl("Conditional", c.indigo)
hl("Repeat", c.indigo)
hl("Statement", c.indigo)

hl("PreProc", c.cyan) -- Agora um tom de vermelho
hl("Include", c.cyan)
hl("Define", c.cyan)
hl("Macro", c.cyan)

hl("Identifier", c.c_white) -- Agora vermelho claro
hl("Operator", c.blue) -- Agora um tom de vermelho
hl("Type", c.cyan) -- Agora um tom de vermelho
hl("Constant", c.orange)
hl("Special", c.blue)

-- --- Interface ---
hl("Search", c.black, c.yellow)
hl("Visual", nil, c.ui_hover)
hl("MatchParen", c.c_white, c.ui_border, "bold")

hl("Error", c.c_red, nil, "bold") -- Mantido vermelho puro
hl("ErrorMsg", c.c_red, nil, "bold")
hl("WarningMsg", c.yellow, nil, "bold") -- Mantido amarelo
hl("DiagnosticInfo", c.cyan) -- Agora um tom de vermelho para info
hl("DiagnosticHint", c.c_white) -- Agora vermelho claro

-- --- Menus ---
hl("Pmenu", c.c_white, c.ui_border)
hl("PmenuSel", c.ui_bg, c.violet)
