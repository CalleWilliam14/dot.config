source $VIMRUNTIME/defaults.vim

" Plug - It is not necessary
call plug#begin()

Plug 'jiangmiao/auto-pairs'

" Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

call plug#end()

" vim - lsp
" function! s:on_lsp_buffer_enabled() abort
function! OnLspBufferEnabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes

    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> gl <plug>(lsp-document-diagnostics)
    nmap <buffer> <f2> <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    " autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    autocmd User lsp_buffer_enabled call OnLspBufferEnabled()
augroup END

" jellybeans conf
" if has('termguicolors')
"     set termguicolors
" endif
" 
" let g:jellybeans_overrides = {
" \   'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
" \}
" 
" if has('termguicolors') && &termguicolors
"     set cursorline
"     :highlight CursorLine cterm=bold ctermbg=black
"     let g:jellybeans_overrides['background']['guibg'] = 'none'
"     colorscheme jellybeans
" endif

" onedark conf
if has('termguicolors')
    set termguicolors
endif

let g:onedark_color_overrides = {
\ 'background': { 'gui': '#000000', 'cterm': '235', 'cterm16': '0' },
\}

let g:onedark_terminal_italics = 1

colorscheme onedark

" settings
set guicursor=n-v-c:block,o:hor50,i-ci:hor15,r-cr:hor30,sm:block
set mouse=
set number
set relativenumber
set showmatch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set wrap
set linebreak
set nolist
set breakindent
set scrolloff=18

autocmd FileType html,css,javascript,javascriptreact,typescript,typescriptreact,lua setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent

