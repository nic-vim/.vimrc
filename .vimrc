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
" ShowMarks
Plugin 'showmarks'
" NERDTree
Plugin 'scrooloose/nerdtree'
" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'
" Vim Vinegar
Plugin 'tpope/vim-vinegar'

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

"---------------Search---------------"

" afficher/masquer le surlignement des résultats d'une recherche avec ctrl+n
" en mode normal
"function! ToggleHLSearch()
"	if &hls
"		set nohls
"	else
"		set hls
"	endif
"endfunction

" F3 pour activer/désactiver le surlignage des recherches
noremap <Esc>OR :set hlsearch! hlsearch?<CR>

"---------------Split Management---------------"

set splitbelow     " split par defaut au dessous
set splitright     " split par defaut a droite

nnoremap <S-Down> <C-w>j
nnoremap <S-Up> <C-w>k
nnoremap <S-Left> <C-w>h
nnoremap <S-Right> <C-w>l

"---------------Plugins---------------"

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

"---------------Mappings Divers---------------"

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
noremap « <
noremap » >
inoremap « <

noremap wd <C-w>c
noremap wo <C-w>s
noremap wp <C-w>o
noremap w<SPACE> :split<CR>
noremap w<CR> :vsplit<CR>

" Chiffres en accès direct
" ————————————————————————
noremap " 1
noremap 1 "
noremap « 2
noremap 2 <
noremap » 3
noremap 3 >
noremap ( 4
noremap 4 (
noremap ) 5
noremap 5 )
noremap @ 6
noremap 6 @
noremap + 7
noremap 7 +
noremap - 8
noremap 8 -
noremap / 9
noremap 9 /
noremap * 0
noremap 0 *
noremap! " 1
noremap! 1 "
noremap! « 2
noremap! 2 <
noremap! » 3
noremap! 3 >
noremap! ( 4
noremap! 4 (
noremap! ) 5
noremap! 5 )
noremap! @ 6
noremap! 6 @
noremap! + 7
noremap! 7 +
noremap! - 8
noremap! 8 -
noremap! / 9
noremap! 9 /
noremap! * 0
noremap! 0 *

" Activer ou désactiver le mode Paste avec <F2> pour coller du texte sans formatage
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Coller avec le registre "0
nnoremap <F3> "0p

" mapping de tous les caractères de a à z avec Alt
let c='a'
while c <= 'z'
	exec "map \e".c." <M-".c.">"
	exec "map! \e".c." <M-".c.">"
	let c = nr2char(1+char2nr(c))
endw

" mapping emmet
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Quitter le mode insertion
:imap ts <ESC>
:vmap ts <ESC>

" Redimension window
nnoremap <F5> :resize -1<CR>
nnoremap <F6> :resize +1<CR>
nnoremap <S-F5> :vertical resize -1<CR>
nnoremap <S-F6> :vertical resize +1<CR>
inoremap <F5> <C-o>:resize -1<CR>
inoremap <F6> <C-o>:resize +1<CR>
inoremap <S-F5> <C-o>:vertical resize -1<CR>
inoremap <S-F6> <C-o>:vertical resize +1<CR>

" Raccourcis touche <leader> ,
" Enregistrement avec ;
nnoremap <leader>e <Esc>:w<CR>
" complétion avec n
inoremap <leader>n <C-n>
" coller le registre "* avec p
inoremap <leader>p <C-o>"*p
nnoremap <leader>p "*p
" indentation automatique de l'ensemble du document
nmap <leader>b ggv<S-g>=''
imap <leader>b <Esc>ggv<S-g>=''i
" Raccourci pour éditer le fichier .vimrc
nmap <leader>ov :tabe $MYVIMRC<CR>


" Raccourcis déplacements
imap <C-d> <C-o>s
imap <C-t> <C-o>t
imap <C-c> <C-o>c
imap <C-r> <C-o>r

imap II <Esc>I
imap AA <Esc>A
imap OO <Esc>O
imap LL <Esc>L
imap SS <Esc>S
imap DD <Esc>dd
imap UU <Esc>ui

" space
nnoremap <Space> :NERDTreeToggle<CR>

" backspace
nnoremap <BS> i<BS><Right><Esc>
nmap <C-l> <BS>
inoremap <C-l> <BS>
" cariage return
nnoremap <CR> i<CR><Esc>
nnoremap <F8> O<Esc>
nnoremap <F9> o<Esc>

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

" Deplacement du curseur au numero de ligne
nnoremap <F4> G

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ALT GR
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
" ê 
noremap <Esc>ê (
noremap! <Esc>ê (
" à
noremap <Esc>à )
noremap! <Esc>à )
" a
noremap <Esc>a [
noremap! <Esc>a [
" u
noremap <Esc>u ]
noremap! <Esc>u ]
" p
noremap <Esc>p :
noremap! <Esc>p :

" SHIFT
        
" Divers
cmap ç !
inoremap <C-y> <C-o>o
inoremap <A-y> <C-o>

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


"---------------Abreviations---------------"

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
":iab ( ()<C-h>
":iab { {}<C-h>
:iab <!-- <!--<Space><Space>--><Left><Left><Left><Left><Left>
" jQuery
:iab jqon! $4''5.4'', function45{<CR><CR>}5;
:iab jqc! $4''5.css4'', ''5;

"if !exists("g:customized_netrw")
"  let g:customized_netrw = 1
"  execute "nnoremap <buffer> o " . maparg("<CR>", "n")
"  nnoremap <buffer> <CR> :
"endif
