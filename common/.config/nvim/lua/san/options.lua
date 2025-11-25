-- ~/.config/nvim/lua/san/options.lua

local opt = vim.opt

-- Numeração de linha
opt.number = true
opt.relativenumber = true -- Ótimo para movimentos verticais

-- Identação (Tabs = 4 espaços)
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Área de transferência do sistema (se usar wl-copy/xclip)
opt.clipboard = "unnamedplus"
