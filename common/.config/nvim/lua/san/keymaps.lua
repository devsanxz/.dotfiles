-- ~/.config/nvim/lua/san/keymaps.lua

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Definindo a tecla Leader (Geralmente Espaço)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- --- Superpoderes ABNT2 ---

-- 'ç' vai para o final da linha ($)
keymap({ "n", "v", "o" }, "ç", "$", opts)

-- 'Ç' (Shift+ç) vai para o começo do texto (^)
keymap({ "n", "v", "o" }, "Ç", "^", opts)

-- --- Outros Atalhos Úteis ---

-- Limpar busca com ESC (tira o highlight chato depois da busca)
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Salvar com Ctrl+S (Hábito muscular)
keymap({ "n", "i" }, "<C-s>", "<cmd> write <CR>", opts)
