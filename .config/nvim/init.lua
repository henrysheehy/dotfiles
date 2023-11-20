-- Basic configuration settings -----------------------------------------------
vim.opt.number       = true   -- show line numbers
vim.opt.cursorline   = true   -- highlight current line
vim.opt.ruler        = true	  -- shows cursor position in current line
vim.opt.showcmd      = true	  -- shows partially typed commands
vim.opt.hlsearch     = false -- don't highlight search results
vim.opt.incsearch    = false  -- don't jump to search results as search string is being typed
vim.opt.showmode     = false  -- disable in favor of lualine/lightline statusline
vim.opt.foldenable   = true  -- fold text by default when opening files
vim.opt.foldmethod   = "marker"
vim.opt.autowriteall = true   -- write current buffer when moving buffers
vim.opt.wrap         = true   -- wrap long lines
vim.opt.linebreak    = true   -- break lines at words
vim.opt.signcolumn   = "no"   -- disable LSP diagnostic symbols in left column
vim.opt.autochdir = true
-- vim.g.loaded_netrw       = 1 -- disable netrw
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.ranger_map_keys = 0 --disable <Leader>f :Ranger<CR>
-- vim.g.NERDTreeHijackNetrw = 0
-- vim.g.ranger_replace_netrw = 1 --open ranger when vim open a directory
vim.g.vmt_auto_update_on_save = 1 -- Toc updates

vim.cmd[[
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
]]

vim.keymap.set('', '<Space>', '<NOP>')
vim.g.mapleader = " "  -- set global leader key

if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end

-- Persistent undo https://www.adrian.idv.hk/2022-05-07-nvim-lua/
-- vim.opt.undodir = vim.fn.stdpath('config') .. '/.undo'
vim.opt.undodir:prepend(os.getenv("HOME") .. "/.config/nvim/.undo//")
-- vim.opt.undofile 
vim.opt.undofile = true

-- OS detection
if vim.fn.exists("g:os_current") == 0 then
  if vim.fn.system('uname -s') == "Linux\n" then
    vim.g.os_current = "Linux"
  elseif vim.fn.system('uname -s') == "Darwin\n" then
    vim.g.os_current = "Darwin"
  else
    print("Error: the current operating system won't support all of my Vim configurations.")
    vim.g.os_current = "Other"
  end
end

if vim.g.os_current == "Linux" then
  vim.g.python3_host_prog = "/usr/bin/python3"
elseif vim.g.os_current == "Darwin" then
  vim.g.python3_host_prog = "/usr/local/bin/python3"
end

-- Load plugins with vim-plug
-- --------------------------------------------- --
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'scrooloose/syntastic'
Plug 'junegunn/vim-plug'
Plug 'shaunsingh/nord.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ggandor/leap.nvim'
Plug 'ggandor/flit.nvim'
Plug 'ggandor/leap-spooky.nvim'
Plug 'tpope/vim-commentary'
Plug('kylechui/nvim-surround', {tag = '*'})
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'coachshea/vim-textobj-markdown'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
-- Plug 'junegunn/fzf'
-- Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'akinsho/toggleterm.nvim'
Plug 'jedrzejboczar/toggletasks.nvim'
Plug 'airblade/vim-rooter'
Plug 'L3MON4D3/LuaSnip'
Plug 'brenoprata10/nvim-highlight-colors' --Displays colors based on their HEX/rgb/hsl value
Plug 'rbgrouleff/bclose.vim' -- ranger.vim dependency
Plug 'francoiscabrol/ranger.vim' 
Plug 'nvim-tree/nvim-web-devicons' -- optional, for file icons
Plug 'vim-voom/voom'
Plug 'windwp/nvim-autopairs'
Plug 'max397574/better-escape.nvim'

-- Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'VonHeikemen/lsp-zero.nvim'

-- Filetype-specific
Plug('iamcco/markdown-preview.nvim', {['do'] = 'cd app && yarn install'})
Plug('godlygeek/tabular')
Plug('preservim/vim-markdown')
-- Plug 'mzlogin/vim-markdown-toc'
Plug 'SidOfc/mkdx'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'lervag/vimtex'
Plug 'pocco81/auto-save.nvim'
-- Plug 'Konfekt/FastFold'

-- Translation
Plug 'kraftwerk28/gtranslate.nvim'

-- LSP-like
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.0'})
Plug 'RRethy/vim-illuminate'
Plug('nvim-Treesitter/nvim-Treesitter', {['do'] = ':TSUpdate'})
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
-- Plug 'williamboman/mason.nvim'
-- Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

-- Firefox
Plug 'glacambre/firenvim'

-- Local plugins
Plug '~/.config/nvim/personal/vim-mpv'
Plug '~/.config/nvim/personal/vim-beanquery'

vim.call('plug#end')
-- --------------------------------------------- --
-- End loading plugins

--[[ vim.cmd('colorscheme nord') ]]

-- Personal configuration
require('personal/init/copy-paste')
require('personal/init/navigation')
require('personal/init/indent')
require('personal/init/insert-mode')
require('personal/init/projects')

-- Plugin configuration
require('plugins/auto-save')
require('plugins/lspconfig')
require('plugins/treesitter')
require('plugins/illuminate')
require('plugins/dispatch')
require('plugins/easy-align')
require('plugins/telescope')
require('plugins/nvim-surround')
require('plugins/toggleterm')
require('plugins/toggletasks')
require('plugins/rooter')
require('plugins/lualine')
-- require('plugins/lightspeed')
require('leap').add_default_mappings()
require('plugins/LuaSnip')
require('nvim-highlight-colors').setup {}
-- require("mason").setup()
-- require("mason-lspconfig").setup()
-- local server_opts = {}
-- require("lspconfig").omnisharp.setup(server_opts)
require("better_escape").setup {
  mapping ={"jj"},  
  timeout = vim.o.timeoutlen,
  clear_empty_lines = false,  
  keys = "<Esc>"} 

-- BEGIN MISCELLANEOUS
-- --------------------------------------------- "
-- Easier write command
vim.keymap.set('n', '<Leader>w', '<Cmd>write<CR>')

-- Change default fold command
vim.keymap.set('n', 'zf', 'zc')
vim.keymap.set('n', 'zc', 'zf')

-- easier edit command
vim.keymap.set('n', '<Leader>e', ':edit ')

-- Easier help command
vim.keymap.set('n', '<Leader>h', ':help ')

-- For easy macro playback; note that this overrides entering Ex mode with Q
vim.keymap.set('n', 'Q', '@q')

-- Easily pull up the Git command (for use with vim-fugitive)
vim.keymap.set('n', '<Leader>g', ':Git ')

-- Rough analog of `:join` or `J` for lines above cursor
vim.keymap.set('n', 'K', 'kdd$')

-- Move current line up and down
-- See https://www.reddit.com/r/neovim/comments/mbj8m5/how_to_setup_ctrlshiftkey_mappings_in_neovim_and/
vim.keymap.set('n', '<C-Up>', '<Cmd>move .-2<CR>')
vim.keymap.set('n', '<C-Down>', '<Cmd>move .+1<CR>')

-- Move selected lines up and down
-- See https://stackoverflow.com/questions/41084565/moving-multiple-lines-in-vim-visual-mode
vim.cmd([[
xnoremap <C-Down> :m'>+<CR>gv=gv
xnoremap <C-Up>  :m-2<CR>gv=gv
]])

-- Global substitute
vim.keymap.set('n', '<Leader>s', ':%s/')
vim.keymap.set('v', '<Leader>s', ':s/')

-- Set swap file directory to within Vim directory
vim.opt.directory:prepend(os.getenv("HOME") .. "/.config/nvim/swap//")

-- Use escape to return to normal mode in a Neovim terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Easier window navigation in terminals
-- vim.keymap.set('t', '<C-S-Up>', '<C-\\><C-n><C-w>k')
-- vim.keymap.set('t', '<C-S-Down>', '<C-\\><C-n><C-w>j')

-- Disable automatic comment continuation on next line
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd(
    "BufReadPost",
    { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
  )

-- Write and quit if possible/applicable, force quit otherwise
vim.keymap.set('n', '<Leader>q',
  function()
    local success, result = pcall(vim.cmd, 'wq')
    if not success then
      vim.cmd('q!')
    end
  end,
  {desc = 'Write and quit if possible/applicable, force quit otherwise.'})

-- Open link under cursor
-- vim.cmd([[
--   function! OpenURLUnderCursor()
--     let s:uri = expand('<cWORD>')
--     let s:uri = substitute(s:uri, '?', '\\?', '')
--     let s:uri = shellescape(s:uri, 1)
--     if s:uri != ''
--       silent exec "!gio '".s:uri."'"
--       :redraw!
--     endif
--   endfunction
--   nnoremap gx :call OpenURLUnderCursor()<CR>
--   ]])

-- Save and close all buffers
vim.keymap.set('n', '<Leader>Q', '<Cmd>wqa<CR>')

-- Sort text by paragraph (useful for e.g. for Beancount files)
-- Implements https://stackoverflow.com/a/24099469
vim.api.nvim_create_user_command('SortByParagraph', ':%s/\\(.\\+\\)\\n/\\1@/ | :sort | :%s/@/\\r/g', {})

-- Source my spelling configurations.
-- Important: make sure to set mapleader before sourcing my_spell,
-- so that my_spell mappings use the correct leader key.
require('personal/spell/my_spell')

-- Use `d` (delimiter) for targets.vim block text objects
-- (Requires targets.vim)
vim.cmd[[
autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'd': {'pair': [{'o':'(', 'c':')'}, {'o':'[', 'c':']'}, {'o':'{', 'c':'}'}]},
    \ })
]]

-- -- Delimiters
-- vim.keymap.set('i', '(', '()<Left>')
-- vim.keymap.set('i', '<', '<><Left>')
-- vim.keymap.set('i', '<|', '<|')
-- vim.keymap.set('i', '$$', '$$<Left>')
-- vim.keymap.set('i', '{', '{}<Left>')
-- vim.keymap.set('i', '[', '[]<Left>')
-- vim.keymap.set('i', '"', '""<Left>')
-- vim.keymap.set('i', '""', '""""""<Left><Left><Left>')

-- Highlight colours
vim.keymap.set('', '<Leader>hc', '<Cmd>HighlightColorsToggle<CR>')

vim.keymap.set('n', '<Leader>l', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>')

-- vim.keymap.set('', '<Leader>r', '<Cmd>Ranger<CR>')

-- Open new ranger window in CWD
-- vim.keymap.set('', '<Leader>r', '<Cmd>:silent !alacritty -e ranger "$(dirname %)" &<CR>')

-- Navigation
vim.keymap.set('', '<Shift-Down>', '<S-Down>')
vim.keymap.set('', '<Shift-Left>', 'b')
vim.keymap.set('', '<Shift-Up>', '<S-Up>')
vim.keymap.set('', '<Shift-Right>', 'w')

-- Inkscape
vim.cmd[[
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
]]

-- fzf - replaced with telescope
-- vim.keymap.set('', '<C-b>', '<Cmd>:Buffers<CR>')
-- vim.keymap.set('', '<C-s>', '<Cmd>:Files<CR>')

-- LSP config
require('lsp/lsp')

-- Nvim-autopairs
require("nvim-autopairs").setup {}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- Open snippets

vim.keymap.set('', '<Leader><S-s>', '<Cmd>:new $HOME/.config/nvim/LuaSnip/<CR>')

vim.keymap.set('', '<F8>', '<C-i>')
vim.keymap.set('', '<F9>', '<C-m>')

-- BEGIN :
-- Pythontex and Minted
-- Developed from https://evesdropper.dev/files/luasnip/conditions-minted/
-- local ls = require("luasnip")
-- END
