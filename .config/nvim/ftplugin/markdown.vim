" settings for the markdown-preview.nvim plugin
let g:mkdp_refresh_slow = 1
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 1,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

noremap <buffer> <silent><leader>v :MarkdownPreview<cr>
" noremap <buffer> <leader>tm i## Contents<esc>:GenTocGFM<cr>
noremap <buffer> <leader>x :syntax sync fromstart<cr>

setlocal expandtab
setlocal autoindent
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

" Disable default key mappings for the textobj_markdown plugin
let g:textobj_markdown_no_default_key_mappings = 1

omap <buffer> ac <plug>(textobj-markdown-chunk-a)
xmap <buffer> ac <plug>(textobj-markdown-chunk-a)
omap <buffer> ic <plug>(textobj-markdown-chunk-i)
xmap <buffer> ic <plug>(textobj-markdown-chunk-i)
omap <buffer> aC <plug>(textobj-markdown-Bchunk-a)
xmap <buffer> aC <plug>(textobj-markdown-Bchunk-a)
omap <buffer> iC <plug>(textobj-markdown-Bchunk-i)
xmap <buffer> iC <plug>(textobj-markdown-Bchunk-i)

map <buffer> ]] <Plug>(textobj-markdown-Gheader-n)
map <buffer> [[ <Plug>(textobj-markdown-Gheader-p)
xmap <buffer> ]] <Plug>(textobj-markdown-Gheader-n)
xmap <buffer> [[ <Plug>(textobj-markdown-Gheader-p)
omap <buffer> ]] <Plug>(textobj-markdown-Gheader-n)
omap <buffer> [[ <Plug>(textobj-markdown-Gheader-p)

" Disable mappings
omap <buffer> <plug> <plug>(textobj-markdown-text-i)
omap <buffer> <plug> <plug>(textobj-markdown-text-a)
omap <buffer> <plug> <plug>(textobj-markdown-Btext-i)
omap <buffer> <plug> <plug>(textobj-markdown-Btext-a)
xmap <buffer> <plug> <plug>(textobj-markdown-text-i)
xmap <buffer> <plug> <plug>(textobj-markdown-text-a)
xmap <buffer> <plug> <plug>(textobj-markdown-Btext-i)
xmap <buffer> <plug> <plug>(textobj-markdown-Btext-a)


" Header movement
map <buffer> <plug> <Plug>(textobj-markdown-header-n)
map <buffer> <plug> <Plug>(textobj-markdown-header-p)
map <buffer> <plug> <Plug>(textobj-markdown-Sheader-n)
map <buffer> <plug> <Plug>(textobj-markdown-Sheader-p)
map <buffer> <plug> <Plug>(textobj-markdown-SSheader-n)
map <buffer> <plug> <Plug>(textobj-markdown-SSheader-p)
xmap <buffer> <plug> <Plug>(textobj-markdown-header-n)
xmap <buffer> <plug> <Plug>(textobj-markdown-header-p)
xmap <buffer> <plug> <Plug>(textobj-markdown-Sheader-n)
xmap <buffer> <plug> <Plug>(textobj-markdown-Sheader-p)
xmap <buffer> <plug> <Plug>(textobj-markdown-SSheader-n)
xmap <buffer> <plug> <Plug>(textobj-markdown-SSheader-p)
omap <buffer> <plug> <Plug>(textobj-markdown-header-n)
omap <buffer> <plug> <Plug>(textobj-markdown-header-p)
omap <buffer> <plug> <Plug>(textobj-markdown-Sheader-n)
omap <buffer> <plug> <Plug>(textobj-markdown-Sheader-p)
omap <buffer> <plug> <Plug>(textobj-markdown-SSheader-n)
omap <buffer> <plug> <Plug>(textobj-markdown-SSheader-p)

" Fence block movement
map <buffer> <plug> <plug>(textobj-markdown-chunk-n)
map <buffer> <plug> <plug>(textobj-markdown-chunk-p)
map <buffer> <plug> <plug>(textobj-markdown-chunk-N)
map <buffer> <plug> <plug>(textobj-markdown-chunk-P)
xmap <buffer> <plug> <plug>(textobj-markdown-chunk-n)
xmap <buffer> <plug> <plug>(textobj-markdown-chunk-p)
xmap <buffer> <plug> <plug>(textobj-markdown-chunk-N)
xmap <buffer> <plug> <plug>(textobj-markdown-chunk-P)
omap <buffer> <plug> <plug>(textobj-markdown-chunk-n)
omap <buffer> <plug> <plug>(textobj-markdown-chunk-p)
omap <buffer> <plug> <plug>(textobj-markdown-chunk-N)
omap <buffer> <plug> <plug>(textobj-markdown-chunk-P)

let markdown_fenced_languages = ['tex=latex', 'python','viml=vim','bash=sh']
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
set conceallevel=2
" let g:vim_markdown_folding_disabled = 1

" Inkscape
nnoremap <C-f> :silent exec '.!~/.script/inkscape-vim/ink.py %:p:h "'.getline(".").'"'<CR><CR>

" Markdown Preview
let g:mkdp_theme = 'light'

let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'shift': 0 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'fold': { 'enable': 0 },
                        \ 'tab': {'enable':0}}
let g:polyglot_disabled = ['markdown'] " for vim-polyglot users, it loads Plasticboy's markdown
                                       " plugin which unfortunately interferes with mkdx list indentation.

                                       let g:vim_markdown_new_list_item_indent = 0

" Delete these two lines:
" setlocal formatoptions=tqlnrc
" set comments=b:> 
