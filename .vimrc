syntax on
" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

call vundle#begin()
Plugin 'Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
"Plugin 'numirias/semshi'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
" Plugin 'xuhdev/vim-latex-live-preview'
" Plugin 'francoiscabrol/ranger.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'commentary.vim'
call vundle#end()

"so that you don’t have to add .ycm_extra_conf.py in every directory where you run vim.
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

" VimTex
let g:tex_flavor='lualatex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Snippets
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

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
nnoremap <leader><space> :nohlsearch<CR>
set foldenable
set foldlevelstart=10
nnoremap <space> za
set foldmethod=indent
nnoremap j gj
nnoremap k gk

" fzf
set rtp+=~/.fzf
nnoremap <leader>f :FZF<CR>

" Ranger
function RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun
