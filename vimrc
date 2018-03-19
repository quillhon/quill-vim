"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: QuiLl HoN
"
" Version: 1.0 - 15/11/17
"
" GitHub: https://github.com/quillhon/quill-vim
"
" Sections:
"   -> Plug
"   -> General
"   -> VIM User Interface
"   -> Colors and Fonts
"   -> Files and Backups
"   -> Formatting
"   -> Visual Mode
"   -> Command Mode
"   -> Moving in Tabs and Buffers
"   -> Editing Mappings
"
"   -> Python section
"
"   -> Plugin Configuration
"
" Plugins_Included:
"
"   All plugins are managed by Plug
"
"   > NERDTree
"   The NERDTree is a file system explorer for the Vim editor.
"
"   > fzf
"   fzf is a general-purpose command-line fuzzy finder.
"
"   > vim-airline
"   status/tabline for vim that's light as air.
"
"   > leshill/vim-json
"   JSON syntax highlighting
"
"   > vim-javascript
"   JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
"
"   > vim-jsx
"   Syntax highlighting and indenting for JSX. JSX is a JavaScript syntax transformer which translates inline XML document fragments into JavaScript objects.
"
"   > vim-vue
"   Vim syntax highlighting for Vue components.
"
"   > ale
"   Asynchronous Lint Engine
"   
"   > vim-surround
"   Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
"
" Revisions:
"   > 0.1: First Version
"   > 0.2: Slim Useless Function
"   > 0.3: Change The Bundle management tools to Vundle
"   > 0.4: Add few plugin and configure for powerline
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" be iMproved
set nocompatible

" Plug {
    " Basic Configation {
        call plug#begin('~/.vim/plugged')
    " }

    " Install Plugin {

        " Browse
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        Plug 'scrooloose/nerdtree'
        Plug 'bling/vim-airline'
        Plug 'valloric/matchtagalways'
        Plug 'tpope/vim-fugitive'

        " Syntax
        Plug 'pangloss/vim-javascript'
        Plug 'mxw/vim-jsx'
        Plug 'posva/vim-vue'
        Plug 'ekalinin/dockerfile.vim'
        Plug 'stanangeloff/php.vim'

        " Coding
        Plug 'w0rp/ale'
        Plug 'tpope/vim-surround'
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'


        " Color Scheme
        Plug 'altercation/vim-colors-solarized'

    " }
    
    call plug#end()
" }

" General {

    " Sets how many lines of history VIM has to remember
    set history=700

    " Enable filetype plugin
    filetype plugin on
    filetype indent on

    " Set to auto read when a file is changed from the outside
    set autoread

    " With a map leader it's possible to do extra key combinations
    let mapleader = ","
    let g:mapleader = ","

    " Fast editing of the .vimrc
    map <leader>e :e! ~/.vimrc<cr>

    " Don't add the comment prefix when I hit enter or o/O on a comment line.
    autocmd FileType * setlocal formatoptions-=r formatoptions-=o
" }

" VIM User Interface {
    set scrolloff=7                     " set 7 lines to the curors - when moving vertical..
    set cmdheight=2                     " the commandbar height
    set backspace=eol,start,indent      " set backspace config
    set magic                           " set magic on, for regular expressions
    set showmode                        " indicates input or replace mode at bottom
    set number                          " show line number
    " set mat=1000                      " how many tenths of a second to blink

    " Wildmenu {
        " show completion in command mode
        set wildmenu                    " turn on WiLd menu
        set wildmode=list:longest,full	" comand <Tab> completion, list matches, then longest common part, then all.
    " }

    " Search {
        set ignorecase                  " case insensitive searching
        set hlsearch                    " Highlight search things
        set incsearch                   " make search like instant search
        set showmatch                   " show matching brackets when text indicator is over them
    " }

    " Ruler {
        set ruler                       " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
		set showcmd
    " }

    " No sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
" }

" Colors and Fonts {
    syntax enable                       " enable syntax highlight

    if has('win32') || has('win64')
    else
        set shell=/bin/zsh
    endif

    " Setting for GUI
    if has('gui_running')
        set guioptions-=T
        set columns=143 lines=50
    endif

    set t_Co=256
    set background=dark                 " set a dark background
    colorscheme solarized               " load a colorscheme

    " Set encoding and default language
    set encoding=utf8
    try
        lang en_US
    catch
    endtry

    set ffs=unix,dos,mac                " default file types

    set term=screen-256color
" }

" Files and Backups {
    " Turn backup off.
    set nobackup
    set nowb
    set noswapfile
" }

" Formatting {
    set autoindent      " indent at the same level of the previous line
    set shiftwidth=4    " indent = 4 spaces
    set smartindent
    set expandtab       " change tab to spaces
    set tabstop=4       " indentation for four columns
    set smarttab

    set linebreak       " line breaker when wrap
    set wrap            " wrap lines
    set textwidth=500   " max text in a line
" }


" Visual Mode {
    " Visual shifting without exiting Visual mode
    vnoremap < <gv
    vnoremap > >gv
" }

" Command Mode {
    " Smart mappings on the command line
    cno $c e <C-\>eCurrentFileDir("e")<cr>

    func! CurrentFileDir(cmd)
      return a:cmd . " " . expand("%:p:h") . "/"
    endfunc
" }


" Moving in Tabs and Buffers {
    map <silent> <leader><cr> :noh<cr>  " map <leader>enter to cancel highlight

    " Windows {
        " Smart way to move between windows
        map <c-j> <c-w>j
        map <c-k> <c-w>k
        map <c-h> <c-w>h
        map <c-l> <c-w>l
    " }

    " Buffer {
        " Use the arrows to something usefull
        map <right> :bn<cr>
        map <left> :bp<cr>

        map <leader>cd :cd %:p:h<cr>    " map <leader>cd to changing CWD to buffer directory
    " }

    " Tab {
        map <leader>tn :tabnew %<cr>
        map <leader>te :tabedit
        map <leader>tc :tabclose<cr>
        map <leader>tm :tabmove
    " }
" }

" Editing Mappings {
    "Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
    nmap <M-j> mz:m+<cr>`z
    nmap <M-k> mz:m-2<cr>`z
    vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
    vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

    " Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>m mmHmt:%s/<c-v><cr>//ge<cr>'tzt'm
" }

" Spell Checking {
    "Pressing ,ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>

    "Shortcuts using <leader>
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=
" }

" Python {
    " au FileType python set nocindent
    let python_highlight_all = 1
    " au FileType python syn keyword pythonDecorator True None False self

    au FileType python set colorcolumn=80

    au BufNewFile,BufRead *.jinja set syntax=htmljinja
    au BufNewFile,BufRead *.mako set ft=mako

    "Delete trailing white space
    func! DeleteTrailingWS()
      exe "normal mz"
      %s/\s\+$//ge
      exe "normal `z"
    endfunc
    autocmd BufWrite *.py :call DeleteTrailingWS()
" }

" Javascript {
    au FileType javascript set shiftwidth=2
    au FileType javascript set tabstop=2
" }

" Plugin {
    " *Use <leader> key to toggle plugins*

    " fzf {
        nmap <leader>f :Files<cr>
        nmap <leader>b :Buffers<cr>
    " }

    " NERD Tree {
        let NERDTreeIgnore=['\.pyc$']

        map <leader>n :NERDTreeToggle<cr>
        cno $nb NERDTreeFromBookmark 
    " }
    
    " airline {
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'

        let g:airline_powerline_fonts = 1
    " }

    " vim-javascript {
        let g:javascript_plugin_flow = 1
    " }

    " vim-jsx {
        let g:jsx_ext_required = 0
    " }

    " vim-vue {
        autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

        au FileType vue.html.javascript.css set shiftwidth=2
        au FileType vue.html.javascript.css set tabstop=2
    " }
    
    " ale {
        let g:ale_lint_on_save = 1
        let g:ale_lint_on_text_changed = 0

        let g:airline#extensions#ale#enabled = 1
    " }
" }
