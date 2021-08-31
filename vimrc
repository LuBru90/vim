"" lukas brunner VIM-Config
"" 24.04.20 22:39


"""" Editing
    let mapleader=" "

    inoremap jj <Esc>
    noremap <c-9> :cnext<CR>
    noremap <c-8> :cprev<CR>

    noremap > <<<Esc>
    noremap < >><Esc>

    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv

    vnoremap < >gv
    vnoremap > <gv

    nnoremap ,f :FZF<cr>
    set backspace=indent,eol,start
    set history=1000
    set wildignore+=.pyc,.swp

call plug#begin()

    Plug 'ludovicchabant/vim-gutentags'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf'
    Plug 'airblade/vim-gitgutter'
    Plug 'sillybun/vim-repl'

call plug#end()

"""" REPL
    let g:repl_position = 3
    let g:sendtorepl_invoke_key = ",r"
    let g:repl_cursor_down = 0
    let g:repl_program = {'python': ['ipython'],'default': ['bash']}
    let g:repl_ipython_version = '7.22'
    nnoremap ,a :REPLToggle<Cr>
    nnoremap ,b :REPLSendSession<Cr>

"""" General
    filetype indent plugin on
    set nocompatible
    set autochdir
    set scrolloff=1
    set sidescrolloff=5
    set linebreak
    set hidden
    set autoread

"""" Extra files
    set nowritebackup
    set noswapfile
    set nobackup
    set undofile
    set undodir=C:\Users\lbrunner\vimfiles\undos

"""" Visuals
    syntax on
    set number relativenumber
    color industry
    highlight Visual ctermfg=black ctermbg=white
    highlight MatchParen cterm=none ctermfg=red ctermbg=black
    highlight Search cterm=NONE ctermfg=black ctermbg=lightgreen
    highlight Comment ctermfg=red
    highlight Conditional ctermfg=yellow
    highlight Function ctermfg=yellow
    highlight Constant ctermfg=blue

    set hlsearch
    set incsearch
    set ignorecase
    set wrap!
    nnoremap <expr> n 'Nn'[v:searchforward]
    nnoremap <expr> N 'nN'[v:searchforward]
    nnoremap n nzz
    nnoremap N Nzz


"" Statusbar
    " show path and date 
    ""set laststatus=2
    ""set statusline=\ %r%F\ \ %=%{strftime('%c')[:-4]}\ 
    ""let timer = timer_start(60000, 'UpdateStatusBar',{'repeat':-1})
    ""function! UpdateStatusBar(timer)
    ""    execute 'let &ro = &ro'
    ""endfunction

"" Tabs
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set shiftround
    set expandtab
    set autoindent
    set smartindent

"" Change window size
    map ê <c-e>
    map ë <c-y>

    map è 3<c-w>>
    map ì 3<c-w><
    "map ê 3<c-w>-
    "map ë 3<c-w>+

"" Move between windows
    "map <c-l> <c-w>l
    "map <c-h> <c-w>h
    "map <c-j> <c-w>j
    "map <c-k> <c-w>k

"" Autocomplete
    ""inoremap " ""<esc>i
    ""inoremap [ []<esc>i
    ""inoremap { {}<esc>i

"""" Commands
    command! MD !start cmd

"" Go to definition
    nnoremap F <C-]>zz
    nnoremap B <C-t>zz

"""" Copy Pasta
    "vnoremap ,c "+y
    nnoremap ,v "+p

"""" Tabs
    noremap ,w :tabnew%<enter>

    map ,1 1gt
    map ,2 2gt
    map ,3 3gt
    map ,4 4gt

"""" Gutter
    set signcolumn=yes
    highlight clear SignColumn

    "let g:gitgutter_git_executable = 'C:\Users\lbrunner\AppData\Local\Programs\Git\bin\git.exe'
    set updatetime=500

    noremap ,d :GitGutterLineHighlightsToggle<cr>
    noremap ( :GitGutterPrevHunk<cr>zz
    noremap ) :GitGutterNextHunk<cr>zz
    noremap ,s :GitGutterPreviewHunk<cr>
