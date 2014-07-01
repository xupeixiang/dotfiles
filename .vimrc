""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin stuffs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'taglist.vim'

" original repos on GitHub
"Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'hdima/python-syntax'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-commentary'

" Taglist
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Left_Window=1
let Tlist_WinWidth=45
let tlist_cpp_settings = 'c++;n:namespace;v:variable;m:member;d:macro;t:typedef;' .
                             \ 'c:class;g:enum;s:struct;u:union;f:function'

" YouCompleteMe
"let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_min_num_identifier_candidate_chars=4

" NERDTree
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_checkers=['pyflakes']

" Airline
let g:airline_theme="powerlineish"
let g:airline_section_b = "%{getcwd()}"
let g:airline_section_warning = ""
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"Indent
"let g:indent_guides_enable_on_vim_startup = 1           <Leader>ig 
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=grey ctermbg=grey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkgrey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" line no
set nu

" folding
set fdm=indent
set foldlevelstart=1

" open last location
if has("autocmd")
      au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Make backspace work like sane editors
set bs=2

" Show command when you type them
set sc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable
colorscheme grb256
hi LineNr ctermfg=darkgrey

" current line
set cursorline
hi CursorLine cterm=none
hi CursorLineNr ctermfg=white guifg=white
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

autocmd BufNewFile *.py 0r ~/.vim/template/python.py

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python stuffs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"python syntax plugin
let python_version_2=1
let python_highlight_all=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Map Key  stuffs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Common
map Y y$

" Windows split movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" Tabs
map <tab> gt

" Taglist
map <F2> :TlistToggle<cr> 
map <F12> :! ctags -R --languages=c++,python --langmap=c++:+.inl -h +.inl --c++-kinds=+px --fields=+aiKSz --extra=+q <cr><cr>

" NerdTree
map <F3> :NERDTreeToggle<cr>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<cr>
\gvy/<c-r><c-r>=substitute(
\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
\gV:call setreg('"', old_reg, old_regtype)<cr>
vnoremap <silent> # :<C-U>
\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<cr>
\gvy?<c-r><c-r>=substitute(
\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
\gV:call setreg('"', old_reg, old_regtype)<cr>
