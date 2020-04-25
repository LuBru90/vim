"""""" lubru VIM-Config
"" 24.04.20 22:39

"""" Editing
    "map <F2> :r! date /t "+\%Y-\%m-\%d \%H:\%M:\%S"<enter>
    map <F2> k:put=strftime(\"%d.%m.%y %H:%M\")<enter>J
    set virtualedit=insert
    inoremap jj <Esc>
    noremap > <<<Esc>
    noremap < >><Esc>
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv

    let mapleader=" "
    nnoremap <leader>s :w<enter>:VimtexCompileSS<enter>
    map <leader>v :set virtualedit=all<enter>
    map <leader>i :set virtualedit=insert<enter>

call plug#begin()

    Plug 'ludovicchabant/vim-gutentags'
    Plug 'lervag/vimtex'
    Plug 'gyim/vim-boxdraw'
    Plug 'tpope/vim-speeddating'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-surround'

    Plug 'ervandew/supertab'
    let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
    let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
    let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

    " Snippets "
    Plug 'honza/vim-snippets'
    Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
    ""let g:UltiSnipsJumpBackwardTrigger="<leader><tab>"

call plug#end()

"""" General
    ""set encoding=utf-8
    filetype indent plugin on
    set nocompatible
    set autochdir

"""" Extra files
    set nowritebackup
    set noswapfile
    set nobackup
    set undodir=C:\Users\Brunn\vimfiles\undos
    set undofile

"""" Visuals
    syntax on
    set number
    color industry
    highlight Comment ctermfg=gray
    highlight Visual cterm=reverse
    set hlsearch
    set incsearch
    set ignorecase
    
    " Buggy?"
    " .txt highlighting"
    " Header "
    au BufEnter *.txt 1match Identifier /^\*\*\* .*/ "*** Bla"
    " Section "
    au BufEnter *.txt 2match Define /^\* .*/         "* Bla"
    " SubSection"
    ""au BufEnter *.txt 3match Constant /. \*\* .*/    " ** Bla"

"" Statusbar
    " show path and date 
    set laststatus=2
    set statusline=\ %r%F\ \ %=%{strftime('%c')[:-4]}\ 
    let timer = timer_start(60000, 'UpdateStatusBar',{'repeat':-1})
    function! UpdateStatusBar(timer)
        execute 'let &ro = &ro'
    endfunction

"" Tabs
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set shiftround
    set expandtab
    set autoindent
    set smartindent

"" Change window size
    map è 3<c-w>>
    map ì 3<c-w><
    map ê 3<c-w>-
    map ë 3<c-w>+

"" Move between windows
    map <c-l> <c-w>l
    map <c-h> <c-w>h
    map <c-j> <c-w>j
    map <c-k> <c-w>k

"" Autocomplete
    inoremap " ""<esc>i
    inoremap [ []<esc>i
    inoremap { {}<esc>i
    ""inoremap { {<Enter>}<esc>O

"""" Commands
    ""command! T !ctags -R
    ""set tags=tags;

    command! MD !start cmd
    map <c-s> :w %<Enter>

"" Go to definition
    map T :!ctags -R<enter>
    map <leader>j <C-]>
    map <leader>k <C-t>

"""" Copy Pasta
    vnoremap <leader>c "+y   
    nnoremap <leader>p "+p   

"""""" Nice to know
    "" Pipe to vim
    " :r ! ipconfig | findstr IP
    " :redraw!
    
    " "my yank to m-register
    " "mp copy from m-register

"""" Windows commands
    "" findstr string2find fileName



