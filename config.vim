" Modified version of:
" https://github.com/mutewinter/dot_vim/blob/master/config.vim
" ---------------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ---------------------------------------------
"
" ---------------
" Color
" ---------------
" set background=dark
colorscheme jellybeans
" colorscheme seoul256 " Really nice, but the overall low-contrast feel is
" really stiffling for me to read my code, I prefer jellybeans' readability.
" let g:seoul256_background = 234
" let g:solarized_termtrans = 1
" let g:solarized_underline = 0

" Force 256 color mode if available
if $TERM =~ "-256color"
    set t_Co=256
endif
set encoding=utf-8

syntax enable
highlight LineNr ctermfg=30

" Sytastic stuff

" Enable Syntastic to automatically load errors into the location list
let g:syntastic_always_populate_loc_list = 1

" Enable Syntastic to check for errors when a file is loaded into Vim
let g:syntastic_check_on_open = 1

" Use custom error and warning symbols to Syntastic
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" Add vim-airline buffer list to the top of Vim
let g:airline#extensions#tabline#enabled = 1

" Define airline plugin font for compatability
let g:airline_powerline_fonts = 1
"
" Powerline theme
let g:airline_theme = 'base16'
" let g:airline_theme = 'wombat'
" let g:airline_theme = 'light'

" -----------------------------
" File Locations
" -----------------------------
set backup
set backupdir=~/.vim/.backup// " Double // causes backups to use full file path
set directory=~/.vim/.tmp//
set writebackup
" I commented out the two above becasue it doesn't work
"properly on my Mac OSX Yosemite Terminal, don't know why, and don't care.
set spellfile=~/.vim/spell/custom.en.utf-8.add
" Persistent Undo
if has('persistent_undo')
    set undofile
    set undodir=~/.vim/.undo
endif
" ---------------
" UI
" ---------------
set ruler          " Ruler on
set number         " Line numbers on so I can easily jump with <line#>gg
"set relativenumber " Lune numbers change to show how far away they are from the current line
set cursorline
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
set encoding=utf-8
set noshowmode     " Don't show the mode since Powerline shows it
set title          " Set the title of the window in the terminal to the file
if exists('+colorcolumn')
    set colorcolumn=80 " Color the 80th column differently as a wrapping guide.
endif
" Disable tooltips for hovering keywords in Vim
if exists('+ballooneval')
    " This doesn't seem to stop tooltips for Ruby files
    set noballooneval
    " 100 second delay seems to be the only way to disable the tooltips
    set balloondelay=100000
endif

" ---------------
" Behaviors
" ---------------
set wildmenu            " visual autocomplete for command menu
set hidden             " Change buffer - without saving
set history=300         " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set ttimeout
set ttimeoutlen=100    " Time to wait for a command (after leader for example).
set formatoptions=crql
set iskeyword+=\$,-   " Add extra characters that are valid parts of variables
set nostartofline      " Don't go to the start of the line after some commands
set scrolloff=99        " Keep 99 lines below the last line when scrolling, effectively shifting the middle of the screen on scroll.
set scrolloff=5        " Keep 5 lines below the last line when scrolling.
set gdefault           " this makes search/replace global by default
set switchbuf=useopen  " Switch to an existing buffer if one exists
set whichwrap+=<,>,h,l,[,]
set splitright
set splitbelow

" ---------------
" Text Format
" ---------------
filetype indent on
set tabstop=4 " number of visual spaces per tab"
set softtabstop=4 " number of spaces in tab when editing"
set backspace=indent,eol,start " Delete everything with backspace
set shiftwidth=4 " Tabs under smart indent
set shiftround
set cindent
set autoindent
set smarttab
set expandtab " tabs are spaces"

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch  " Incremental search
set hlsearch   " Highlight search results
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
            \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc,*/node_modules/*,
            \rake-pipeline-*

" ---------------
" Visual
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" Show invisible characters
set list

" Show trailing spaces as dots and carats for extended lines.
" From Janus, http://git.io/PLbAlw

" Reset the listchars
set listchars=""
" make tabs visible
set listchars=tab:▸▸
" show trailing spaces as dots
set listchars+=trail:•
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a    " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U

" save and restore folds when a file is closed and re-opened
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* loadview
