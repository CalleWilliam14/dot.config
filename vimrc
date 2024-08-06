source $VIMRUNTIME/defaults.vim

" Plug - It is not necessary
call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'

" Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'uiiaoo/java-syntax.vim'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

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
    nmap <buffer> <f3> <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    " autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    autocmd User lsp_buffer_enabled call OnLspBufferEnabled()
augroup END

" asyncomplete
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" 
" imap <c-space> <Plug>(asyncomplete_force_refresh)
" For Vim 8 (<c-@> corresponds to <c-space>):
" imap <c-@> <Plug>(asyncomplete_force_refresh)

" nerdtree
autocmd FileType nerdtree setlocal relativenumber

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" Close the tab if NERDTree is the only window remaining in it.
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
 
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

nnoremap <C-b> :NERDTreeToggle<CR>

if has('termguicolors')
    set termguicolors
endif

" jellybeans conf
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
let g:onedark_color_overrides = {
\ 'background': { 'gui': '#000000', 'cterm': '235', 'cterm16': '0' },
\}

let g:onedark_terminal_italics = 1

colorscheme onedark
 

augroup desert_override
    autocmd!
    " I like green statements
    autocmd ColorScheme desert hi Statement guifg=#5FD75F ctermfg=green
    " I like transparent background for terminals
    autocmd ColorScheme desert hi Normal ctermbg=NONE
    " I like italic comments
    autocmd ColorScheme desert hi Comment cterm=italic gui=italic
    " etc ...
augroup END

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

