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
" Indent Line
Plugin 'Yggdroot/indentLine'
" Relative Numbers 
Bundle "jeffkreeftmeijer/vim-numbertoggle"
" Vim Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" EasyMotion
Plugin 'easymotion/vim-easymotion'
" /Incsearch 
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'


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

" surligne les résultats de recherche
set hlsearch		

" retour à la ligne intelligent, indentation automatique
set autoindent		

" affichage des numéros de ligne
set number		

" affiche les commandes incomplètes
set showcmd            

set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
	set nobackup      " do not keep a backup file, use versions instead
else
	set backup        " keep a backup file (restore to previous version)
	set undofile      " keep an undo file (undo changes after closing)
endif

" keep 50 lines of command line history
set history=100      
" show the cursor position all the time
set ruler       
" display incomplete commands
set showcmd     
" do incremental searching
set incsearch       

set timeout timeoutlen=200 ttimeoutlen=200

set complete=.,w,b,u,t,i,kspell    " options de l'auto completion

" Menu de sélection qui s'affiche au dessus de la ligne de status
set wildmenu

"SWAGG
"set relativenumber                           " setting line numbers
"set colorcolumn=81                           " line to show 81 character mark
set cursorline                               " shows the horizontal cursor line


"---------------Visuals---------------"
"—————————————————————————————————————"

" Theme
set background=light
colorscheme peachpuff 
set nowrap

"---------------Split Management---------------"
"——————————————————————————————————————————————"

set splitbelow     " split par defaut au dessous
set splitright     " split par defaut a droite

nnoremap <S-Down> <C-w>j
nnoremap <S-Up> <C-w>k
nnoremap <S-Left> <C-w>h
nnoremap <S-Right> <C-w>l

"---------------Session Management------------"
"—————————————————————————————————————————————"
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_comand_aliases = 1
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>


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

"/
"/ Vim Bookmarks
"/
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_location_list = 1

"/
"/ IndentLines
"/
let g:indentLine_color_term = 239

"/
"/ Vim Airline
"/
set laststatus=2

"---------------Mappings Divers---------------"
"—————————————————————————————————————————————"

" {W} -> [É]
" ——————————
" On remappe W sur É :
noremap é w
noremap É W
onoremap é w
onoremap É W
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

"noremap wd <C-w>c
"noremap wo <C-w>s
"noremap wp <C-w>o


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

lnoremap " 1
lnoremap 1 "
lnoremap « 2
lnoremap 2 <
lnoremap » 3
lnoremap 3 >
lnoremap ( 4
lnoremap 4 (
lnoremap ) 5
lnoremap 5 )
lnoremap @ 6
lnoremap 6 @
lnoremap + 7
lnoremap 7 +
lnoremap - 8
lnoremap 8 -
lnoremap / 9
lnoremap 9 /
lnoremap * 0
lnoremap 0 *

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

" Activer/Désactiver le mode langue lmap
:map! <F8> <C-^> 


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


" Deplacement du curseur au numero de ligne
noremap <F4> G

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


" mapping de tous les caractères de a à z avec Alt
let c='a'
while c <= 'z'
	exec "map \e".c." <M-".c.">"
	exec "map! \e".c." <M-".c.">"
	let c = nr2char(1+char2nr(c))
endw

" Quitter le mode insertion
:imap td <ESC>
:vmap td <ESC>

" Raccourcis touche <leader> ,
" ————————————————————————————
"
" Enregistrement
nnoremap <leader>w <Esc>:wa<CR>
" complétion avec n
inoremap <leader>n <C-n>
" coller le registre "* avec p
inoremap <leader>p <C-o>"*p
nnoremap <leader>p "*p
" indentation automatique de l'ensemble du document
nmap <leader>b ggv<S-g>=''zz
imap <leader>b <Esc>ggv<S-g>=''zzi
" Éditer le fichier .vimrc
nmap <leader>ev :tabe $MYVIMRC<CR>
" Buffer suivant
nnoremap <leader><Tab> :bnext<CR>
" activer/désactiver le surlignage des recherches
noremap <leader>h :set hlsearch! hlsearch?<CR>
" Ouvrir un nouvel onglet
nmap <leader>t <Esc>:tabnew<CR>


" Raccourcis déplacements en mode insertion
" —————————————————————————————————————————

imap <A-s> <Up>
imap <A-t> <Down>
imap <A-c> <Left>
imap <A-r> <Right>

cmap <A-s> <Up>
cmap <A-t> <Down>
cmap <A-c> <Left>
cmap <A-r> <Right>

imap II <Esc>I
imap AA <Esc>A
imap OO <Esc>O
imap LL <Esc>L
imap DD <Esc>dd
imap UU <Esc>ui

" Backspace avec '
inoremap <Esc><Char-39> <BS>
cnoremap <Esc><Char-39> <BS>

" Retour chariot
inoremap <A-v> <CR>
cnoremap <A-v> <CR>

" Déplacement de lignes ou de bloc
noremap <silent> <A-Down> :m .+1<CR>==
noremap <silent> <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Raccourcis onglets
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
nnoremap gr :tabprevious<CR>

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
"noremap <Esc>a [
"noremap! <Esc>a [
" u
"noremap <Esc>u ]
"noremap! <Esc>u ]
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

" Copier/Coller/Supprimer/Insérer
noremap à $
noremap ê ^
onoremap é iw
onoremap u iW
nnoremap l* v$<Left><Left>c
omap j h
omap z f

" Mise en forme
" —————————————
inoremap <Esc>l ═
inoremap <Esc>j ║
inoremap <Esc>z ╔
inoremap <Esc>w ╗
inoremap <Esc>n ╝
inoremap <Esc>m ╚
inoremap <Esc>ç ╠
inoremap <Esc>q ╣
inoremap <Esc>g ╦
inoremap <Esc>h ╩
inoremap <Esc>f ╬

" Autocompletion
inoremap èèn <C-x><C-n>
inoremap èèf <C-x><C-f>

" Divers
cmap ç !
inoremap éé <C-o>
nnoremap èo A<CR><Esc>
inoremap èo <C-o>$<CR>
inoremap oè <Esc>O
nnoremap <leader>fp :put =expand('%:p')<CR>

" Mapping Plugins
" ———————————————

" Vim Bookmarks
"nmap <Leader><Leader> <Plug>BookmarkToggle
"nmap <Leader>i <Plug>BookmarkAnnotate
nmap mf <Plug>BookmarkShowAll
nmap mç <Plug>BookmarkNext
nmap mn <Plug>BookmarkPrev
nmap mj <Plug>BookmarkClear
nmap ma <Plug>BookmarkClearAll
nmap mss <Plug>BookmarkMoveUp
nmap mtt <Plug>BookmarkMoveDown

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" emmet
let g:user_emmet_expandabbr_key='<leader>e'
imap <expr> <leader>e emmet#expandAbbrIntelligent("\<leader>e")

" Relative Numbers
let g:NumberToggleTrigger="<F10>"

" EasyMotion
nmap k <Plug>(easymotion-overwin-f2)


" Restoring position when run a command in multiple buffers
"——————————————————————————————————————————————————————————

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

autocmd VimEnter * :execute "normal i\<F8>\<Esc>"

	"---------------Abbreviations---------------"

	" Fonction pour supprimer l'espace ajouté à la fin
	func! Eatchar(pat)
		let c = nr2char(getchar(0))
		return (c =~ a:pat) ? '' : c
	endfunc

	:iab <silent> if if 45<Left><C-R>=Eatchar4'\s'5<CR>
	:iab cl$ console.log45;<Left><Left><C-R>=Eatchar4'\s'5<CR>
	:iab el$ else<CR>{<CR><CR>}<C-o>2k<C-R>=Eatchar4'\s'5<CR>
	:iab for$ for 4i = *; i 2 ; i775<CR>{<CR><CR>}<Up><C-R>=Eatchar4'\s'5<CR>
	:iab sw$ switch45<cr>{<CR>case : <CR>break;<CR><CR>case : <CR>break;<CR>}
	:iab fu$ function 45 {<CR><CR>}<Up><Up><C-R>=Eatchar4'\s'5<CR>
	:iab (f$ 4'', function 45 {<CR>}5;<Up><Left><C-R>=Eatchar4'\s'5<CR>
	:iab fa$ 4function 45 {<CR><CR>}545;<Up><Left><C-R>=Eatchar4'\s'5<CR>
	" jQuery
	:iab jf('$ $4''5.4'', function45<CR>{<CR><CR>}5;<C-R>=Eatchar4'\s'5<CR>
	:iab jqon$ $4''5.on4'', function45{<CR><CR>}5;<C-R>=Eatchar4'\s'5<CR>
	:iab jqc$ $4''5.css4'', ''5;<C-R>=Eatchar4'\s'5<CR>
	:iab box1 ╔════════════════════╗<CR>║        ║<CR>╚════════════════════╝<Up><Left><Left>

	inoremap (( ()<Left>
	inoremap )) ();<Left><Left>
	inoremap (' ('')<Left><Left>
	inoremap )' ('');<Left><Left><Left>
	inoremap (" ("")<Left><Left>
	inoremap )" ("");<Left><Left><Left>
	inoremap [[ []<Left>
	inoremap ]] [];<Left><Left>
	inoremap [" [""]<Left><Left>
	inoremap ]" [""];<Left><Left><Left>
	inoremap {{ {<CR><CR>}<Up>
	inoremap '' ''<Left>
	inoremap "" ""<Left>
	inoremap b" =""<Left><C-R>=Eatchar('\s')<CR> 
	inoremap "> "";<Left><Left><C-R>=Eatchar('\s')<CR>
	inoremap ;; :<Space>;<Left><C-R>=Eatchar('\s')<CR>
	inoremap == <Space>=<Space>;<Left><C-R>=Eatchar('\s')<CR>
	inoremap ==" <Space>=<Space>"";<Left><Left><C-R>=Eatchar('\s')<CR>

