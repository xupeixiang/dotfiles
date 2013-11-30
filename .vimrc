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

" Taglist
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Left_Window=1
let Tlist_WinWidth=45

" YouCompleteMe
"let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_min_num_identifier_candidate_chars=4

" NERDTree 
let NERDTreeAutoCenter=1
let NERDTreeChDirMode=2
let g:NERDTreeMinimalUI=1
map <F3> :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--select=F,C9 --max-complexity=10'

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
set foldlevelstart=99          " default not open


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

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%F%m%r%h%w\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
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

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
\gvy/<C-R><C-R>=substitute(
\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
\gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
\gvy?<C-R><C-R>=substitute(
\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
\gV:call setreg('"', old_reg, old_regtype)<CR>

" completion
inoremap<S-tab> <C-p>

" ycm goto
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
