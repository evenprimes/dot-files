""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modern search.
set incsearch

" Ignore case while searching.
set ignorecase

" Highlight as we go.
set hlsearch

" Yes, autoindent all the time.
set autoindent

" Show matching brackets.
set showmatch

" Sane backspace behavior.
set backspace=indent,eol,start

" I don't understand exactly what this does so I'm commenting it out.
" set whichwrap+=<,>,h,l

" Always show current position
set ruler

" Show the command being typed
set showcmd

" Hieght of command bar
set cmdheight=2

" Enable line numbers on all files.
set number

" Enable syntax highlighting.
syntax enable

" Turn off backups.  That's why we have git.
set nobackup

" Never use tabs, only spaces.
set expandtab

" Handle spacing as if we had tabs, even with spaces.
set smarttab

" Always indent 4 spaces.
set shiftwidth=4

" Set tabs to show as 4 spaces as well.  May mess up foreign file formats.
set tabstop=4

" Don't be dumb about shifts, only go to next tabstop
set shiftround  

" Set default encoding.
set encoding=utf-8

" Show whitespace and EOL marks.
set listchars=tab:▸\ ,eol:¬

" Always show EOL and tab chars.
set list

" set listchars=tab:â–¸\ ,eol:Â¬,trail:â–ª
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Set the color scheme
colorscheme torte

" When folding, have a 3 column wide folding space.
set foldcolumn=6

" Fold based on indent.
set foldmethod=indent

" Set font in windows. This is probably not very portable since the InputMono
" font is new and only available as a download.  Still, it's a very nice font
" so use it when possible.
if has("gui_running")
    if has("gui_win32")
        set guifont=InputMono:h10:cANSI
    elseif has("gui_macvim")
        set guifont=InputMono:h16
    endif
    set lines=50
    set columns=100
endif

" Auto trim trailing blank spaces.  Makes Python happy! :)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()  " Python files
autocmd BufWrite *.pyx :call DeleteTrailingWS() " Cython files
autocmd BufWrite *.cmd :call DeleteTrailingWS() " Windows batch files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remapping commands
"
" Remap <esc> to jk.  
inoremap jk <esc>

nnoremap <C-t> :tabnew<cr>
nnoremap <C-b> :tabprevious<cr>
nnoremap <C-n> :tabnext<cr>
inoremap <C-t> <esc>:tabnew<cr>
inoremap <C-b> <esc>:tabprevious<cr>
inoremap <C-n> <esc>:tabnext<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug ins
"
" Install pathogen
"  -- https://github.com/tpope/vim-pathogen
"filetype off
"call pathogen#infect()
"call pathogen#helptags()
"filetype plugin indent on
"syntax on
