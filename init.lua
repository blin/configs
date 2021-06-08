-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------- PLUGINS -------------------------------
cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
paq {'nvim-lua/completion-nvim'}
paq {'morhetz/gruvbox'}

-------------------- OPTIONS -------------------------------
cmd 'colorscheme gruvbox'            -- Put your favorite colorscheme here
g.gruvbox_contrast_light = 'hard'
opt.background = 'light'

opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- Completion options (for deoplete)
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
opt.number = true                   -- Show line numbers
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = 2                  -- Size of an indent
opt.sidescrolloff = 8               -- Columns of context
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = 2                     -- Number of spaces tabs count for
opt.termguicolors = true            -- True color support
opt.wildmode = {'longest', 'list'}  -- Command-line completion mode
opt.wrap = false                    -- Disable line wrap

g.mapleader = '<space>'

-------------------- MAPPINGS ------------------------------
map('i', '<C-h>', '<left>')
map('i', '<C-l>', '<right>')
map('i', '<C-j>', '<down>')
map('i', '<C-k>', '<up>')

map('i', '<C-c>', '<esc>')

-------------------- TREE-SITTER ---------------------------
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

-------------------- LSP -----------------------------------
local lsp = require 'lspconfig'
local completion = require 'completion'

lsp.gopls.setup {}

map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
