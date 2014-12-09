"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: QuiLl HoN
"
" Version: 0.3 - 14/09/11
"
" GitHub: https://github.com/quillhon/quill-vim
"
" Sections:
"   -> Vundle
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
"   All plugins are managed by Vundle
"
"   > python
"   Enhanced version of the original (from vim6.1) python.vim for Python programming language
"
"   > L9
"   l9 is a Vim-script library, which provides some utility functions and commands for programming in Vim. 
"
"   > FuzzyFinder
"   Fuzzy/Partial pattern explorer for buffer/file/MRU/command/bookmark/tag/etc.
"
"   > NERDTree
"   The NERD tree allows you to explore your filesystem and to open files and directories.
"
"   > minibufexpl
"   Elegant buffer explorer
"
"   > Powerline
"   Powerline is a utility plugin which allows you to create better-looking, 
"   more functional vim statuslines.
"
"   > snipMate
"   Snippets for many languages (similar to TextMate's):
"           
"   > surround
"   Makes it easy to work with surrounding text.
"           
"   > MatchTag
"   This plugin highlights the matching HTML tag when the cursor is positioned on a tag.
"
"   > tComment
"   An extensible & universal comment vim-plugin that also handles embedded filetypes
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

" Vundle {
    " Basic Configation {
        filetype off                   " required!

        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()

        " Manage Vundle by Vundle
        Plugin 'gmarik/Vundle.vim'
    " }

    " Install Plugin {

        " Syntax highlight
        Plugin 'python.vim'
        
        " Browse
        Plugin 'L9'
        Plugin 'FuzzyFinder'
        Plugin 'taglist.vim'
        Plugin 'The-NERD-tree'
        Plugin 'minibufexpl.vim'
        Plugin 'Lokaltog/vim-powerline'

        " Coding
        Plugin 'quillhon/snipMate'
        Plugin 'surround.vim'
        Plugin 'gregsexton/MatchTag'

        " Comment
        Plugin 'tComment'

        " YouCompleteMe
        Plugin 'Valloric/YouCompleteMe'

        " Color Scheme
        Plugin 'altercation/vim-colors-solarized'

    " }
    
    call vundle#end()
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
" }

" VIM User Interface {
    set scrolloff=7                     " set 7 lines to the curors - when moving vertical..
    set cmdheight=2                     " the commandbar height
    set backspace=eol,start,indent      " set backspace config
    set magic                           " set magic on, for regular expressions
    set showmode                        " indicates input or replace mode at bottom
    set number                          " show line number
    " set mat=1000                           " how many tenths of a second to blink

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

    " Statusline {
        set laststatus=2

        set statusline=%<%F             " Filename
        set statusline+=\ %m%r%h%w%y      " Options
        set statusline+=\ %{&ff}        " Filetype
        " set statusline+=\ %{strftime(\"%d-%m-%Y\ %H:%M\")}  " Modify Time
        set statusline+=%=              " Align mark
        set statusline+=\ Col:\ %c%V\ Line:\ %l\/%L\[%P\]\          " cursor current info
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
        set shell=/bin/bash
    endif

    " Website for downloading the patched font:
    " https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
    set guifont=Menlo-Powerline               " need to install

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
    map <silent> <leader><cr> :noh<cr>  " map <leader> enter to cancel highlight

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

" Plugin {
    " *Use <leader> key to toggle plugins*

    " Fuzzy Finder {
        map <leader>f :FufFile<cr>
    " }
 
    " MiniBufExplorer {
        map <leader>b :TMiniBufExplorer<cr>
    " }
    
    " NERD Tree {
        let NERDTreeIgnore=['\.pyc$']

        map <leader>n :NERDTreeToggle<cr>
        cno $nb NERDTreeFromBookmark 
    " }

    " Taglist {
        " Need to install ctags
        let Tlist_Ctags_Cmd = "ctags"       " edit the path of ctags

        let g:ctags_statusline = 1
        let Tlist_Use_Right_Window = 1

        nmap <leader>l :TlistToggle<cr>
    " }
 
    " Powerline {
        let g:Powerline_symbols = 'fancy'
    " }
" }
