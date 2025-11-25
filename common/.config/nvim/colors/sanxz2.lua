-- ~/.config/nvim/lua/sanxz2.lua
-- Matriz Aura para Neovim

local M = {}

function M.setup()
	-- 1. Habilitar TrueColor
	vim.opt.termguicolors = true

	-- 2. Definição da Paleta (Matriz Aura Oficial)
	local c = {
		base = "#0F172A", -- Deep (Fundo)
		surface = "#334155", -- Surface (Paineis/Linha Atual)
		text = "#E2E8F0", -- Foreground Suave

		-- Cores de Identidade
		magenta = "#A855F7", -- Lilith (Comandos/Funções)
		magenta_a = "#D4AAFB", -- Lilith Aura (Variaveis Especiais)

		-- Estrutura & Leitura
		blue = "#3B82F6", -- Lugares/Pastas
		ice = "#91E9F6", -- Ice/Cyan Aura (TEXTO/DOCS - Substituto do Branco)
		cyan = "#22D3EE", -- Links/Operadores

		-- Sistema
		green = "#22C55E", -- Execução (Strings)
		yellow = "#FACC15", -- Atenção (Tipos/Constantes)
		red = "#F43F5E", -- Erro

		-- Neutros
		gray = "#64748B", -- Comentários (Legível)
	}

	-- 3. Função Auxiliar para aplicar cores
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

	-- --- APLICAÇÃO DOS GRUPOS ---

	-- Editor Base
	hl("Normal", c.ice, c.base) -- Texto principal é ICE (não branco)
	hl("NormalFloat", c.ice, c.base)
	hl("SignColumn", nil, c.base) -- Coluna lateral limpa
	hl("LineNr", c.gray, nil) -- Números de linha discretos
	hl("CursorLine", nil, c.surface) -- Linha atual destacada (fundo surface)
	hl("CursorLineNr", c.magenta, nil, "bold") -- Número da linha atual (Lilith)

	-- Sintaxe (Lógica da Matriz)
	hl("Comment", c.gray, nil, "italic") -- Comentários

	hl("String", c.green) -- Execução/Dados
	hl("Character", c.green)

	hl("Number", c.magenta_a) -- Números (Matemática/Dados)
	hl("Boolean", c.magenta_a)
	hl("Float", c.magenta_a)

	hl("Function", c.magenta, nil, "bold") -- Identidade (Quem age)
	hl("Keyword", c.magenta) -- Comandos (if, else, return)
	hl("Conditional", c.magenta)
	hl("Repeat", c.magenta)

	hl("Operator", c.cyan) -- Conexões (+, -, =, ==)
	hl("Type", c.yellow) -- Definições (int, bool, struct) - Atenção
	hl("Constant", c.yellow) -- Constantes

	hl("Identifier", c.ice) -- Variáveis normais (Leitura)
	hl("PreProc", c.blue) -- Includes/Imports (Lugares/Estrutura)
	hl("Special", c.cyan) -- Caracteres especiais

	-- Interface / Busca / Seleção
	hl("Search", c.base, c.yellow) -- Busca: Fundo Amarelo (Atenção)
	hl("Visual", nil, c.surface) -- Seleção visual (Sutil)
	hl("MatchParen", c.yellow, c.surface, "bold") -- Parenteses correspondentes

	-- Mensagens e Popups
	hl("Error", c.red, nil, "bold")
	hl("ErrorMsg", c.red, nil, "bold")
	hl("WarningMsg", c.yellow)
	hl("Pmenu", c.ice, c.surface) -- Menu de autocompletar
	hl("PmenuSel", c.base, c.magenta) -- Item selecionado no menu (Lilith)
end

return M
