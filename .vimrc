set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}
" Emmet
Plugin 'mattn/emmet-vim'
" Tpope Vim-commentary
Plugin 'tpope/vim-commentary'
" NERDTree
Plugin 'scrooloose/nerdtree'
" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'
" Vim Vinegar
Plugin 'tpope/vim-vinegar'
" Compiles your less files on the fly
Bundle 'vitalk/vim-lesscss'
" Vim Bookmarks
Plugin 'MattesGroeger/vim-bookmarks'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


let mapleader = ","         " Default key leader 

" enable syntax and plugins (for netrw)
syntax enable

set hlsearch		" surligne les résultats de recherche

set autoindent		" retour à la ligne intelligent, indentation automatique

set number		" affichage des numéros de ligne

set showcmd            " affiche les commandes incomplètes

set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
	set nobackup      " do not keep a backup file, use versions instead
else
	set backup        " keep a backup file (restore to previous version)
	set undofile      " keep an undo file (undo changes after closing)
endif
set history=100      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching

set timeout timeoutlen=200 ttimeoutlen=200

set complete=.,w,b,u,t,i,kspell    " options de l'auto completion

"---------------Visuals---------------"

" Theme
set background=light
colorscheme desert


"---------------Split Management---------------"
"——————————————————————————————————————————————"

set splitbelow     " split par defaut au dessous
set splitright     " split par defaut a droite

nnoremap <S-Down> <C-w>j
nnoremap <S-Up> <C-w>k
nnoremap <S-Left> <C-w>h
nnoremap <S-Right> <C-w>l


"---------------Plugins---------------"
"—————————————————————————————————————"

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|git'
"let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
"nmap <C-R> :CtrlPBufTag<CR>
"nmap <M-e> :CtrlPMRUFiles<CR>

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"/
"/ Lesscss
"/
" less to css executable (full path or simple executable)
let g:lesscss_cmd = '$(which lessc)'
" save css files to separate css folder (relative to original less location)
let g:lesscss_save_to = '../css/'
" disable plugin at startup
let g:lesscss_on = 0


"---------------Mappings Divers---------------"
"—————————————————————————————————————————————"

" {W} -> [É]
" ——————————
" On remappe W sur É :
noremap é w
noremap É W
" Corollaire: on remplace les text objects aw, aW, iw et iW
" pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
onoremap aé aw
onoremap aÉ aW
onoremap ié iw
onoremap iÉ iW
" Pour faciliter les manipulations de fenêtres, on utilise {W} comme un Ctrl+W :
noremap w <C-w>
noremap W <C-w><C-w>
 
" [HJKL] -> {CTSR}
" ————————————————
" {cr} = « gauche / droite »
noremap c h
noremap r l
" {ts} = « haut / bas »
noremap t j
noremap s k
" {CR} = « haut / bas de l'écran »
noremap C H
noremap R L
" {TS} = « joindre / aide »
noremap T J
noremap S K
" Corollaire : repli suivant / précédent
noremap zs zj
noremap zt zk
 
" {HJKL} <- [CTSR]
" ————————————————
" {H} = « Jusqu'à »            (h = suivant, H = précédant)
noremap h t
noremap H T
" {L} = « Change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
noremap l c
noremap L C
" {J} = « Remplace »           (j = un caractère slt, J = reste en « Remplace »)
noremap j r
noremap J R
inoremap <C-j> <C-r>
" {K} = « Substitue »          (k = caractère, K = ligne)
noremap k s
noremap K S
" Corollaire : correction orthographique
noremap ]k ]s
noremap [k [s
 
" Désambiguation de {g}
" —————————————————————
" ligne écran précédente / suivante (à l'intérieur d'une phrase)
noremap gs gk
noremap gt gj
" onglet précédant / suivant
noremap gb gT
noremap gé gt
" optionnel : {gB} / {gÉ} pour aller au premier / dernier onglet
noremap gB :exe "silent! tabfirst"<CR>
noremap gÉ :exe "silent! tablast"<CR>
" optionnel : {g"} pour aller au début de la ligne écran
noremap g" g0
 
" <> en direct
" ————————————
"noremap « <
"noremap » >
"inoremap « <

noremap wd <C-w>c
noremap wo <C-w>s
noremap wp <C-w>o
noremap w<SPACE> :split<CR>
noremap w<CR> :vsplit<CR>

" Chiffres en accès direct
" ————————————————————————
"noremap " 1
"noremap 1 "
"noremap « 2
"noremap 2 « 
"noremap » 3
"noremap 3 »
"noremap ( 4
"noremap 4 (
"noremap ) 5
"noremap 5 )
"noremap @ 6
"noremap 6 @
"noremap + 7
"noremap 7 +
"noremap - 8
"noremap 8 -
"noremap / 9
"noremap 9 /
"noremap * 0
"noremap 0 *
"noremap! " 1
"noremap! 1 "
"noremap! « 2
"noremap! 2 <
"noremap! » 3
"noremap! 3 >
"noremap! ( 4
"noremap! 4 (
"noremap! ) 5
"noremap! 5 )
"noremap! @ 6
"noremap! 6 @
"noremap! + 7
"noremap! 7 +
"noremap! - 8
"noremap! 8 -
"noremap! / 9
"noremap! 9 /
"noremap! * 0
"noremap! 0 *

" Rangée de touches fonctions
" ———————————————————————————
"
" Activer ou désactiver le mode Paste avec <F2> pour coller du texte sans formatage
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Coller le registre "*
nnoremap <F3> "0p
set <S-F3>=[1;2R
nnoremap <S-F3> "*p

" F3 pour activer/désactiver le surlignage des recherches
"noremap <Esc>OR :set hlsearch! hlsearch?<CR>
noremap <C-k> :set hlsearch! hlsearch?<CR>

" Deplacement du curseur au numero de ligne
nnoremap <F4> G

" Redimension window
nnoremap <F5> :resize -1<CR>
nnoremap <F6> :resize +1<CR>
nnoremap <S-F5> :vertical resize -1<CR>
nnoremap <S-F6> :vertical resize +1<CR>
inoremap <F5> <C-o>:resize -1<CR>
inoremap <F6> <C-o>:resize +1<CR>
inoremap <S-F5> <C-o>:vertical resize -1<CR>
inoremap <S-F6> <C-o>:vertical resize +1<CR>

" Ouvrir le buffer numéro n
nnoremap <F7> :buffers<CR>:buffer<Space>

" Insertion d'une ligne vide
nnoremap <F8> O<Esc>
nnoremap <F9> o<Esc>

" ———————————————————————————

" mapping de tous les caractères de a à z avec Alt
let c='a'
while c <= 'z'
	exec "map \e".c." <M-".c.">"
	exec "map! \e".c." <M-".c.">"
	let c = nr2char(1+char2nr(c))
endw

" mapping emmet
let g:user_emmet_expandabbr_key='<leader>e'
imap <expr> <leader>e emmet#expandAbbrIntelligent("\<leader>e")

" Quitter le mode insertion
:imap td <ESC>
:vmap td <ESC>

" Raccourcis touche <leader> ,
" ————————————————————————————
"
" Enregistrement
nnoremap <leader>w <Esc>:w<CR>
" complétion avec n
inoremap <leader>n <C-n>
" coller le registre "* avec p
inoremap <leader>p <C-o>"*p
nnoremap <leader>p "*p
" indentation automatique de l'ensemble du document
nmap <leader>b ggv<S-g>=''
imap <leader>b <Esc>ggv<S-g>=''i
" Éditer le fichier .vimrc
nmap <leader>ov :tabe $MYVIMRC<CR>
" Buffer suivant
nnoremap <leader><Tab> :bnext<CR>

" Raccourcis déplacements en mode insertion
" —————————————————————————————————————————

imap <A-s> <Up>
imap <A-t> <Down>
imap <A-c> <Left>
imap <A-r> <Right>

imap II <Esc>I
imap AA <Esc>A
imap OO <Esc>O
imap LL <Esc>L
imap DD <Esc>dd
imap UU <Esc>ui

" Backspace avec '
inoremap <Esc><Char-39> <BS>

" Retour chariot
inoremap <A-v> <CR>

" Déplacement de lignes ou de bloc
noremap <A-Down> :m .+1<CR>==
noremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Raccourcis onglets
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
nnoremap gr :tabprevious<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ALT GR
" ——————
" Z 
noremap ə @
noremap! ə @
" R
noremap ® +
noremap! ® +
" J
noremap ĳ /
noremap! ĳ /
" H
noremap † -
noremap! † -
" S
noremap ß !
noremap! ß !

" ALT
" ———
" ê 
noremap <Esc>ê (
noremap! <Esc>ê (
" cariage return en mode insertion
inoremap <Esc>à <C-o>o 
" a
noremap <Esc>a [
noremap! <Esc>a [
" u
noremap <Esc>u ]
noremap! <Esc>u ]
" é
noremap <Esc>é :
noremap! <Esc>é :

" SHIFT
" —————

" Espace
" ——————
"
" Espace
nnoremap <Char-32> <C-d>
" Shift
nnoremap <Char-160> <C-u>
" y
nnoremap <Space>y "+yy
" o
nnoremap <Space>o :tabnew<CR>:Explore<CR>
" n
nnoremap <Space>n :NERDTreeToggle<CR>
        
" Divers
cmap ç !
inoremap <C-y> <C-o>o
inoremap <A-y> <C-o>
nnoremap <Char-8> gg

" Copier/Coller amélioré en allant directement à la fin du bloc copié/collé
"vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Restoring position when run a command in multiple buffers
"——————————————————————————————————————————————————————————"

" Like bufdo but restore the current buffer.
function! BufDo(command)
  let currBuff=bufnr("%")
  execute 'bufdo ' . a:command
  execute 'buffer ' . currBuff
endfunction
com! -nargs=+ -complete=command Bufdo call BufDo(<q-args>)

" Like tabdo but restore the current tab.
function! TabDo(command)
  let currTab=tabpagenr()
  execute 'tabdo ' . a:command
  execute 'tabn ' . currTab
endfunction
com! -nargs=+ -complete=command Tabdo call TabDo(<q-args>)

" Like windo but restore the current window.
function! WinDo(command)
  let currwin=winnr()
  let curaltwin=winnr('#')
  execute 'windo ' . a:command
  " restore previous/alt window
  execute curaltwin . 'wincmd w'
  " restore current window
  execute currwin . 'wincmd w'
endfunction
com! -nargs=+ -complete=command Windo call WinDo(<q-args>)


"---------------Auto-Commands---------------"

" Open a NERDTree automatically when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the  only window  left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Automatically source the Vimrc filave
augroup autosourcing
			autocmd!
			autocmd BufWritePost .vimrc source %
augroup end


"---------------Abbreviations---------------"

" Fonction pour supprimer l'espace ajouté à la fin
func! Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

:iabbr <silent> if if 45<Left><C-R>=Eatchar4'\s'5<CR>

:iab cl! console.log45;
:iab if! if ()<CR>{<CR><CR>}
:iab el! else<CR>{<CR><CR>}<C-o>2k
:iab fo! for (i = 0; i < ; i++)<CR>{<CR><CR>}
:iab switch! switch()<cr>{<CR>case : <CR>break;<CR><CR>case : <CR>break;<CR>}
:iab $('! $('').('', function()<CR>{<CR><CR>});
:iab fu! function ()<CR>{<CR><CR>}<C-o>3k<C-o>f(
:iab $(f! $(function(){<CR><CR>});<C-o>k
:ab #b /*********************************************
:ab #e *********************************************/
:iab () 45<C-o>h<C-o>h
":iab { {}
" jQuery
:iab jqon! $4''5.4'', function45{<CR><CR>}5;
:iab jqc! $4''5.css4'', ''5;
