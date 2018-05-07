set encoding=utf-8   " file encoding defaults to UTF8
set nocompatible     " disable backward compatibility with Vi
set nowrap           " disable line wrapping
syntax on            " enable syntax highlighting

set bs=2                       " set backspace to 2 when removing whitespace
set clipboard=unnamed          " share system clipboard
set cursorline                 " highlight current line
set directory=~/.vim/swp       " swap files go here
set expandtab                  " expand tabs to spaces
set hidden                     " hide buffers instead of closing them
set history=1000               " command history of 1000
set hlsearch                   " highlight search terms
set incsearch                  " incremental search
set laststatus=2               " always display status line
set lazyredraw                 " buffer redraws instead of drawing each one
set modelines=0                " never prepend vim config line to file
set nobackup                   " disable backups
set nocindent                  " disable indentation for C-style languages
set noerrorbells               " disable audio bell
set nosmartindent              " smart indentations get in the way
set number                     " show line numbers
set ruler                      " draw ruler
set shiftwidth=2               " indent by 2 spaces
set showtabline=0              " do not draw tabs
set sm                         " show matching braces
set smartcase                  " insensitive by default, switches to case sensitive when capital letters are typed
set softtabstop=2              " tab stops to 2 spaces
set title                      " change terminal title
set ttyfast                    " fast scrolling
set undolevels=1000            " undo history of 1000
set virtualedit=onemore        " put cursor one past end of visual block
set visualbell                 " enable visual bell

" ===============
" Git Gutter
" ===============
let g:gitgutter_grep_command = 'ag --nogroup'
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" ===============
" Syntastic
" ===============
"let g:syntastic_mode_map = { 'mode': 'active' }
"let g:syntastic_ruby_checkers = ['reek', 'rubocop', 'mri']
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '!'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_enable_signs = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_aggregate_errors = 1

let g:javascript_enable_domhtmlcss = 1

" ===============
" CtrlP
" ===============
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use ag over grep

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" ===============
" Remove trailing spaces
" ===============
autocmd FileType c autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType cpp autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType ruby autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType javascript.jsx autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType perl autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType java autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType php autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType go autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType rst autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType python autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType clojure autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType diff autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType erlang autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType elixir autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType json autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType grub autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType make autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType r autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType sass autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType scss autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType sh autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType sshconfig autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType sql autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType vim autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType zsh autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType xml autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType yaml autocmd BufWritePre <buffer> :%s/\s\+$//e

" ===============
" GUI options
" ===============
let g:jellybeans_use_term_italics = 1
colorscheme jellybeans
nmap <C-CR> <Plug>(fullscreen-toggle)
set termguicolors
set guioptions=
set linespace=2
set guifont=Inconsolata:h14
set gfn=Inconsolata\ 14

" ===============
" File extension / type associations
" ===============
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.dump set filetype=sql

" ===============
" Neomake Linters
" ===============
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

