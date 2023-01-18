syntax on
" Vundle
set nocompatible
filetype off
filetype plugin on
set rtp+=~/.vim/bundle/Vundle.vim
"colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

call vundle#begin()
Plugin 'Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
" Plugin 'xuhdev/vim-latex-live-preview'
"Plugin 'numirias/semshi'
" Plugin 'francoiscabrol/ranger.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'commentary.vim'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/deoplete.nvim'
call vundle#end()

" YCM
"so that you don’t have to add .ycm_extra_conf.py in every directory where you run vim.
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<tab>']
let g:ycm_key_list_previous_completion = ['<S-tab>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist={'unite': 1}
let g:ycm_min_num_of_chars_for_completion = 4
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" VimTex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:UltiSnipsEditSplit="vertical"

" Snippets
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

let mapleader=","

set tabstop=4
set softtabstop=4
set number
set showcmd
set cursorline
filetype indent on
set autoindent
set expandtab
set shiftwidth=4
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set clipboard+=unnamedplus
nnoremap <leader><space> :nohlsearch<CR>
set foldenable
set foldlevelstart=10
nnoremap <space> za
set foldmethod=indent
nnoremap j gj
nnoremap k gk

set spell spelllang=en_gb

" Remember folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" fzf
set rtp+=~/.fzf
nnoremap <leader>f :FZF<CR>

nnoremap <F5> <Esc>:w<CR>:!clear;python %<CR>


" Undoer
"" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'

if stridx(&runtimepath, expand(vimDir)) == -1
  " vimDir is not on runtimepath, add it
  let &runtimepath.=','.vimDir
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

nnoremap <C-x> :call RangerExplorer()<CR>
nnoremap <C-w> :w<CR>:call UltiSnips#RefreshSnippets()<CR>:YcmRestartServer<CR>
nnoremap <C-u> :UltiSnipsEdit<CR>
