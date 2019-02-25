" An example for a vimrc file.
"
" Maintainer:      Bram Moolenaar <Bram@vim.org>
" Last change:     2014 Nov 05
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"                for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"              for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup         " do not keep a backup file, use versions instead
else
  set backup           " keep a backup file (restore to previous version)
  set undofile         " keep an undo file (undo changes after closing)
endif
set history=50         " keep 50 lines of command line history
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set incsearch          " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent               " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" MY SETTINGS
set ls=2
set nows
set hlsearch
set incsearch
set tags=$ARUBA_SRC/.tags_$P4CLIENT
set nobackup
set wm=2
set nocscopeverbose
set autoread
"jump by c functions
"map [[ ?{<CR>w99[{
"map ][ /}<CR>b99]}
"map ]] j0[[%/{<CR>
"map map [] k$][%?}<CR>

"nnoremap <F9> :set hlsearch


" ctags dont mess with cscope
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>

"highlight Comment term=reverse ctermfg=cyan
"colorscheme candy "NOTE: This sets the background to dark
set t_Co=256
"highlight String ctermfg=blue
hi Search ctermfg=16 ctermbg=107 cterm=NONE guifg=#182227 guibg=#8bb664 gui=NONE
"hi StatusLine cterm=bold,reverse ctermfg=Cyan
"highlight Comment cterm=bold ctermfg=Cyan

" Highlight long lines (>80)
 fu! LongLineHighlightToggle()
     highlight OverLength ctermfg=white ctermbg=red guibg=#592929
     autocmd BufEnter * highlight OverLength ctermfg=white ctermbg=red guibg=#592929
     autocmd BufEnter * match OverLength /\%81v.*/
     autocmd BufEnter * let w:long_line_match = 1

     if exists('w:long_line_match')
         match OverLength //
         unlet w:long_line_match
     else
         match OverLength /\%81v.*/
         let w:long_line_match = 1
     endif
 endfunction
 "map <Leader>l :call LongLineHighlightToggle()<CR>

map <F12> <Esc>:call LongLineHighlightToggle()<CR>
map <F5>  call LongLineHighlightToggle()
map OS  :!git diff %

set textwidth=80
set expandtab
set tabstop=4
set shiftwidth=4
set cindent
set autoindent
set smartindent
set showmatch
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set background=light
:hi CursorLine   cterm=NONE ctermbg=22 
:hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkred guifg=white

:hi CursorColumn cterm=NONE ctermbg=darkred guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
set cursorline
