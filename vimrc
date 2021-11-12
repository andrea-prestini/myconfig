:imap jj <Esc>
set encoding=utf8
set cursorline
autocmd ColorScheme * highlight CursorlineNr cterm=bold term=bold gui=bold
let NERDTreeShowHidden=1

"=========PYTHON TOOLS=======================================
au BufNewFile,BufRead *.py
	\set tabstop=4
	\set softtabstop=4
	\set shiftwidth=4
	\set textwidth=79
	\set expandtab
	\set autoindent
	\set fileformat=unix
	\set foldmethod=manual
autocmd!
autocmd FileType python highlight Excess ctermbg=Red guibg=Black
autocmd FileType python match Excess /\%80v.*/
autocmd FileType python set nowrap
autocmd FileType python set colorcolumn=120

augroup END
runtime! ftplugin/man.vim
autocmd BufNewFile *.py call append(0, "#!/usr/bin/python3")

:nmap <F6> :set cul!<CR>
map  <F5> :w<CR>:!clear;python3 %<CR>
"SHEBANG PER BASH SCRIPT=====================================
autocmd BufNewFile *.sh call append(0,"#!/bin/bash")
"=============================================================
"FOCUS WINDOW================================================
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set number
"    autocmd WinEnter * set cul
    autocmd WinLeave * set nonumber
"    autocmd WinLeave * set nocul
augroup END

"autocommand per file TEX--------------------------------------------
   autocmd BufNewFile *.tex call append(0,"\\documentclass{article}")
   autocmd BufNewFile *.tex call append(1,"\\usepackage[T1]{fontenc}")
   autocmd BufNewFile *.tex  call append(2,"\\usepackage[utf8]{inputenc}")
   autocmd BufNewFile *.tex call append(3,"\\usepackage[italian]{babel}")
   autocmd BufNewFile *.tex set filetype=tex


"IMPOSTAZIONI SET--------------------------------------------
set clipboard=unnamed
"set cul
" mostriamo sempre la status bar
set laststatus=2
" disabilitando la modalità retro-compatibilità, si attivano
" tutte le features di Vim (in opposizione a Vi)
set nocompatible
" disabilitiamo il wrap delle linee, le linee troppo lunghe
" non verranno mandate a capo creando confusione.
set nowrap
" mostriamo sempre i numeri di riga
set number! relativenumber!
"set number
" mostriamo le coordinate, per riga e colonna, della posizione
" corrente del cursore
set ruler
" se è abilitata l’auto-indentazione, questa viene sostituita
" con 4 spazi
set shiftwidth=4
" evidenzia le parentesi corrispondenti
set showmatch
" sostituisce il carattere di tabulazione con 4 spazi
set tabstop=4 
set softtabstop=4
" disabilitiamo il wrap delle parole
set textwidth=0
" settiamo un numero di possibili undo abbastanza alto...tutti sbagliano
set undolevels=1000
" questa impostazione è una delle più comode, infatti quando digitiamo un
" comando incompleto e premiamo TAB, mostra un comodo menu al
" posto di ciclare su tutte le opzioni
set wildmenu
set wildignore+=*.pyc
set wildignore+=/.PlayOnLinux/*
set wildignore=/vmwareMachine/*
set wildignore+=/.nv/*
set wildignore+=/.local/*
set wildignore+=/.cache/**
set wildignore+=/.SinologyDrive/**
set wildignore+=/.config/code/**
set wildignore+=/.cargo/**

set incsearch

" il nostro terminale ha una palette di colori scuri, vero?
" bene, diciamo a vim di tenerne conto
"set bg=dark
" usiamo gli spazi al posto del carattere di tabulazione
" da pythonista questo è fondamentale
set expandtab
"nmap <leader>l :set list!<CR>
" disabilitiamo il blinking del cursore in modalità normale
"set gcr=n:blinkon0
" salviamo le ultime 100 righe di storia dei comandi
set history=100
" evidenziamo i termini trovati dalla ricerca
set nohlsearch
" forziamo la ricerca case-insensitive
set ignorecase
set statusline=%F%m%r%h%w\ %y\ [row=%l/%L]\ [col=%02v]\ [%02p%%]\
set nocompatible
set listchars=tab:>~,nbsp:_,trail:.,space:£,eol:$
set path+=**
set hidden
set nobackup
set nowritebackup
set noswapfile
set ttimeoutlen=800
set showcmd
set incsearch
"set colorcolumn=80
set mouse=a
" scriviamo le modifiche prima di cambiare buffer
set autowrite
" impostiamo un'unica cartella per i file *~, evitando
" così di lasciarli dispersi per il filesystem
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',/\(\|\s\s)\zs\.\S\+'
let mapleader = ","
"MAPPING=========================================================
:nmap <c-j> <c-w>j
:nmap <c-k> <c-w>k
:nmap <c-l> <c-w>l
:nmap <c-h> <c-w>h
:nmap <space> :
:nmap <C-u> gUiw
"noremap <C-l> guiw
noremap <leader>\ :Commentary<cr>
:nmap <C-f> :bn<CR>
" :nmap <C-b> :bp<CR>
:nmap <leader> /
:nmap <leader><leader> <C-^>
:nmap <F3> :set hlsearch!<CR>
:nmap <F4> :set nonumber! norelativenumber!<CR>
:nmap <F10> :set relativenumber!<CR>
:nmap <F2> :UndotreeToggle<CR>
:nmap tan :tabnew<CR>
:nmap tah :tabnext<CR>
:nmap tac :tabclose<CR>
" :imap <tab> <C-x><C-o> 
"better indentation
vnoremap < <gv
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>
noremap <C-Z> :update<CR>
map <C-e> :NERDTreeToggle<CR>
"====================================================================

cnoreabbrev rt @:
filetype on
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

vnoremap > >gv

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required!
"Bundle 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'

"PLUGIN===============================================
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/searchfold.vim'
Plugin 'lervag/vimtex'
"Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'mbbill/undotree'
Plugin 'klen/python-mode'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tpope/vim-commentary'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'python_ifold'
Plugin 'kalekundert/vim-coiled-snake'
Plugin 'chrisbra/Colorizer'
Plugin 'JamshedVesuna/vim-markdown-preview'


call vundle#end()
filetype plugin indent on
"AIRLINE Customization==========================================
let g:airline#extensions#tabline#enabled = 1
"DIFFsave========================================================
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
"===============================================================

let g:jedi#show_call_signatures=1
let g:jedi#completions_command = "<tab>"

" impostiamo un set di colori predefinito
" colorscheme desert
" colorscheme industry
 colorscheme ron
"colorscheme molokai

" abilitiamo sempre la colorazione del testo in funzione della sintassi riconosciuta
syntax on

" abilitiamo sempre la modalità paste, utile per evitare che
" al copia-incolla vengano inseriti tab non richiesti
"set 

" disabilitiamo l’autoindentazione, fa più danno che altro
"set noautoindent


" ecco un comando veramente furbo. Capita sempre di aprire un file, cominciare
" a modificarlo, per poi scoprire che il file è aperto in sola lettura per
" questione di permessi di accesso. Bene: con questo comando, si forza vim
" a chiudere e riaprire il file con i permessi di sudo (richiedendo la password)
" e salvando il buffer.
cmap w!! %!sudo tee > /dev/null %

"Ctrl-P Fuzzy
if executable('rg')
        let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif
let g:ctrlp_show_hidden = 1
:nmap <C-l> :CtrlPLine <CR>
:nmap <C-b> :CtrlPBuffer <CR>
"Ifold fuzzy
"map Esc in terminal mode to return to Normal mode
tnoremap <Leader><Esc> <C-\><C-n>
"latex PDF
let g:livepreview_previewer = 'okular'
autocmd Filetype tex setl updatetime=3
"chiusura tutti buffer tranne quello corrente
command BufOnly  execute "%bd!|e#|bd#"
nnoremap <leader>b :BufOnly<CR>
" automatismo per mantenere i folding e riaprirli con apertura del file
" augroup remember_folds
    " autocmd!
    " autocmd BufWinLeave * mkview
    " autocmd BufWinEnter * silet! loadview
" augroup END

"Cancellare tutti i registri di VIM
 command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
map <leader>vm :vsp $MYVIMRC<CR>
map <leader>sv :source $MYVIMRC<CR>

if &diff
    colorscheme molokai
endif

au FilterWritePre * if &diff | colorscheme molokai | endif

"Configurazione markdown preview plugin
let vim_markdown_preview_hotkey="<C-m>"
let vim_markdown_preview_github=1

" configuration DIFFmode ADVANCED
set nocompatible
filetype plugin indent on

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set number
set hidden

set splitbelow
set splitright

if &t_Co >= 256 || has("gui_running")
  "let g:dracula_italic=0
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

  if (has("termguicolors"))
    set termguicolors
  endif
endif

augroup aug_color_scheme
  au!

  autocmd ColorScheme dracula call s:PatchColorScheme()
augroup END

function s:PatchColorScheme()
  hi! link DiffChange NONE
  hi! clear DiffChange
  hi! DiffText term=NONE ctermfg=215 ctermbg=233 cterm=NONE guifg=#FFB86C guibg=#14141a gui=NONE

endfunction

packadd!dracula
syntax enable
colorscheme dracula

" Apply a particular color scheme-----------------------------------------------------------------------
" NOTE: Should go after 'autocmd ColorScheme' customization
set background=dark
colorscheme dracula

set diffopt=vertical,filler,context:3,indent-heuristic,algorithm:patience,internal


" Detect if vim is started as a diff tool (vim -d, vimdiff)
" NOTE: Does not work when you start Vim as usual and enter diff mode using :diffthis
if &diff
  let s:is_started_as_vim_diff = 1
  syntax off
  setlocal nospell
endif

augroup aug_diffs
  au!

  " Inspect whether some windows are in diff mode, and apply changes for such windows
  " Run asynchronously, to ensure '&diff' option is properly set by Vim
  au WinEnter,BufEnter * call timer_start(50, 'CheckDiffMode')

augroup END

" In diff mode:
" - Disable syntax highlighting
" - Disable spell checking
function CheckDiffMode(timer)
  let curwin = winnr()

  " Check each window
  for _win in range(1, winnr('$'))
    exe "noautocmd " . _win . "wincmd w"

    call s:change_option_in_diffmode('b:', 'syntax', 'off')
    call s:change_option_in_diffmode('w:', 'spell', 0, 1)
  endfor

  " Get back to original window
  exe "noautocmd " . curwin . "wincmd w"
endfunction

" Detect window or buffer local option is in sync with diff mode
function s:change_option_in_diffmode(scope, option, value, ...)
  let isBoolean = get(a:, "1", 0)
  let backupVarname = a:scope . "_old_" . a:option

  " Entering diff mode
  if &diff && !exists(backupVarname)
    exe "let " . backupVarname . "=&" . a:option
    call s:set_option(a:option, a:value, 1, isBoolean)
  endif

  " Exiting diff mode
  if !&diff && exists(backupVarname)
    let oldValue = eval(backupVarname)
    call s:set_option(a:option, oldValue, 1, isBoolean)
    exe "unlet " . backupVarname
  endif
endfunction

function s:set_option(option, value, ...)
  let isLocal = get(a:, "1", 0)
  let isBoolean = get(a:, "2", 0)
  if isBoolean
    exe (isLocal ? "setlocal " : "set ") . (a:value ? "" : "no") . a:option
  else
    exe (isLocal ? "setlocal " : "set ") . a:option . "=" . a:value
  endif
endfunction

nnoremap <silent> <leader>q :call <SID>QuitWindow()<CR>

function s:QuitWindow()
  if get(s:, 'is_started_as_vim_diff', 0)
    qall
    return
  endif

  quit
endfunction

nmap <expr> <Up> &diff ? '[czz' : '<Up>'
nmap <expr> <Down> &diff ? ']czz' : '<Down>'

let g:gitgutter_enabled = 1
set updatetime=1000
