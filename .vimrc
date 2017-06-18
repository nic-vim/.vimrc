set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle {{{
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
"Plugin 'Yggdroot/indentLine'
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
" Conoline
Plugin 'miyakogi/conoline.vim'
" Ultisnips 
" Track the engine. 
Plugin 'SirVer/ultisnips' 
" Snippets are separated from the engine. Add this if 4you want them: 
Plugin 'honza/vim-snippets' 
" Vim Arpeggio
Plugin 'kana/vim-arpeggio'
" Syntastic
Plugin 'vim-syntastic/syntastic'
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

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

" }}}

" Set Option {{{

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

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

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

set autowrite

"SWAGG
"set relativenumber                           " setting line numbers
"set colorcolumn=81                           " line to show 81 character mark
"set cursorline                               " shows the horizontal cursor line


"---------------Visuals---------------"
"—————————————————————————————————————"

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
"/ Netrw
"/
" let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3

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

"/
"/ Conoline
"/
let g:conoline_auto_enable = 0

" }}}

" Mapping {{{

" mapping de tous les caractères de a à z avec Alt
let c='a'
while c <= 'z'
  exec "map \e".c." <M-".c.">"
  exec "map! \e".c." <M-".c.">"
  let c = nr2char(1+char2nr(c))
endw

" Déplacements"{{{

" {W} -> [É]
" ——————————
" On remappe W sur É :
noremap é w
noremap É W
onoremap é w
onoremap É W

" Saut en fin de mot
nnoremap B ge
nnoremap É e
onoremap é iw
onoremap u iW
" Corollaire: on remplace les text objects aw, aW, iw et iW
" pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
onoremap aé aw
onoremap aÉ aW
onoremap ié iw
onoremap iÉ iW
" Pour faciliter les manipulations de fenêtres, on utilise {W} comme un Ctrl+W :
noremap w <C-w>
noremap W <C-w><C-w>

" [HJKL] -> {TQSR}
" ————————————————
" {tr} = « gauche / droite »
noremap t h
noremap r l
" {ts} = « haut / bas »
nnoremap q gj
vnoremap q gj
nnoremap s gk
vnoremap s gk
" {TR} = « début / fin de ligne »
noremap T ^
noremap R $
" {TS} = « joindre / aide »
noremap Q J
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

" Déplacement au dernier endroit modifié
nnoremap g, g;
"}}}
" Raccourcis déplacements en mode insertion {{{
" —————————————————————————————————————————

imap <A-s> <Up>
imap <A-q> <Down>
imap <A-t> <Left>
imap <A-r> <Right>

cmap <A-s> <Up>
cmap <A-q> <Down>
cmap <A-t> <Left>
cmap <A-r> <Right>

imap II <Esc>I
imap AA <Esc>A
imap OO <Esc>O
imap LL <Esc>L
imap DD <C-o>dd
imap UU <C-o>u

" }}}
" Désambiguation de {g}"{{{
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

"}}}
" Chiffres en accès direct "{{{
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
noremap 8 :Explore<CR> 
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

" }}}
" Édition"{{{
" Quitter le mode insertion
:imap qs <ESC>
:vmap qs <ESC>
" Yank du curseur jusqu'à la fin de la ligne
nnoremap Y y$
" Inverser deux mots
nnoremap <leader>i dawe<right>p

nnoremap l* v$<Left><Left>c
omap j h
omap z f
inoremap éé <C-o>
inoremap é$ <C-o>$
inoremap é" <C-o>_
nnoremap èo A<CR><Esc>
inoremap èo <C-o>$<CR>
"}}}
" Touches fonctions"{{{
" ———————————————————————————
"
" Activer ou désactiver le mode Paste avec <F2> pour coller du texte sans formatage
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Coller le registre "*
nnoremap <F3> "*yy
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
"}}}
" Recherche et remplacement"{{{
nnoremap <Char-32> /
nnoremap <Char-160> ?
"}}}
" Raccourcis touche <leader> , {{{

" ————————————————————————————
"
" Enregistrement
nnoremap <leader>w <Esc>:wa<CR>
" coller le registre "* avec p
noremap <leader>pé "+yy
nnoremap <leader>po "+p
" indentation automatique de l'ensemble du document
nmap <leader>b ggvG=''zz
imap <leader>b <Esc>ggvG=''zzi
" Éditer le fichier .vimrc
nmap <leader>ev :tabe $MYVIMRC<CR>
" activer/désactiver le surlignage des recherches
noremap <leader>h :set hlsearch! hlsearch?<CR>
" Ouvrir un nouvel onglet
nmap <leader>t <Esc>:tabnew<CR>
" Afficher le nombre d'occurence d'une recherche
map ,* *<C-o>:%s///gn<CR>n
nnoremap <leader>. :lcd %:h<cr>
nnoremap <leader>d "_d
nnoremap <leader>q :q!<cr>
nnoremap <leader>z :wq!<cr>
nnoremap <leader>za :wqa!<cr>
" Insertion du chemin complet et du nom du fichier
nnoremap <leader>fp :put =expand('%:p')<CR>
nnoremap <leader>ff "%p
" }}}
" Backspace avec Alt ' et Del avec Alt k"{{{
function! BS_key(...)

  let column = col(".")
  "call Decho ("colum: " . column)

  execute "normal i\<BS>\<ESC>"

  if column == 1
    let column2 = col (".")
    if column2 > 1
      echo column
      execute "normal r"
    endif
  else
    if column > 1
      echo column
      execute "normal r" 
    endif
  endif

endfunction       

nnoremap <BS> :call BS_key()<CR>
nmap <Esc><Char-39> <BS>
imap <Esc><Char-39> <BS>
cmap <Esc><Char-39> <BS>
inoremap <A-k> <Del>
cnoremap <A-k> <Del>"}}}
" Déplacement de lignes ou de bloc"{{{
noremap <silent> <A-Down> :m .+1<CR>==
noremap <silent> <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv
"}}}
" Raccourcis onglets"{{{
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
nnoremap gr :tabprevious<CR>
"}}}
" Auto Center"{{{
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz
"}}}
" Retour chariot"{{{
nnoremap <A-v> i<CR><Esc>
inoremap <A-v> <CR>
cnoremap <A-v> <CR>
"}}}
" ALT GR"{{{
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
noremap! ß !"}}}
" ALT"{{{
" ———
" ê 
noremap <Esc>ê (
noremap! <Esc>ê (
noremap <Esc>é :
noremap! <Esc>é :
"}}}
" SHIFT"{{{
" —————
"}}}
" Espace"{{{
" ——————
"
" Espace
"nnoremap <Char-32> <C-d>
" Shift
"nnoremap <Char-160> <C-u>
" y
nnoremap <Space>y "+yy
" o
nnoremap <Space>o :tabnew<CR>:Explore<CR>
" n
nnoremap <Space>n :NERDTreeToggle<CR>
"}}}
" Sélection"{{{
vmap > >gv
vmap < <gv
"}}}
" Mise en forme box"{{{
" —————————————
inoremap <Esc>l ═
inoremap <Esc>j ║
inoremap <Esc>z ╔
inoremap <Esc>w ╗
inoremap <Esc>n ╝
inoremap <Esc>m ╚
inoremap <Esc>ç ╠
" inoremap <Esc>q ╣
inoremap <Esc>g ╦
inoremap <Esc>h ╩
inoremap <Esc>f ╬
"}}}
" Autocompletion"{{{
inoremap èèn <C-x><C-n>
inoremap èèf <C-x><C-f>
inoremap <leader>f <C-x><C-f>
inoremap <leader>n <C-x><C-n>
inoremap <leader>o <C-x><C-o>
"}}}
" Divers"{{{
" Activer/Désactiver le mode langue lmap
:map! <F8> <C-^> 

" Redéfinition de la lettre q
nnoremap ç q
nnoremap Q @q

" [ et ]
nnoremap ê [
nnoremap Ê <C-[>
nnoremap à ]
nnoremap À <C-]>
"
inoremap j= <C-o>==
inoremap x<space> <C-o>$<space>
"}}}
" Buffers"{{{
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader><Tab> :bnext<CR>
"}}}
" Mapping Plugins {{{
" ———————————————

" Vim Bookmarks"{{{
"nmap <Leader><Leader> <Plug>BookmarkToggle
"nmap <Leader>i <Plug>BookmarkAnnotate
nmap mf <Plug>BookmarkShowAll
nmap mç <Plug>BookmarkNext
nmap mn <Plug>BookmarkPrev
nmap mj <Plug>BookmarkClear
nmap ma <Plug>BookmarkClearAll
nmap mss <Plug>BookmarkMoveUp
nmap mtt <Plug>BookmarkMoveDown
"}}}

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" emmet "{{{
imap   .e   <plug>(emmet-expand-abbr)
imap   <C-y>;   <plug>(emmet-expand-word)
imap   <C-y>u   <plug>(emmet-update-tag)
imap   <C-y>d   <plug>(emmet-balance-tag-inward)
imap   <C-y>D   <plug>(emmet-balance-tag-outward)
imap   <C-y>n   <plug>(emmet-move-next)
imap   <C-y>N   <plug>(emmet-move-prev)
imap   <C-y>i   <plug>(emmet-image-size)
imap   <C-y>/   <plug>(emmet-toggle-comment)
imap   <C-y>j   <plug>(emmet-split-join-tag)
imap   <C-y>k   <plug>(emmet-remove-tag)
imap   <C-y>a   <plug>(emmet-anchorize-url)
imap   <C-y>A   <plug>(emmet-anchorize-summary)
imap   <C-y>m   <plug>(emmet-merge-lines)
imap   <C-y>c   <plug>(emmet-code-pretty)

imap .x <CR><CR><CR><CR><Up><Up>
"}}}

" Relative Numbers
let g:NumberToggleTrigger="<F10>"

" EasyMotion
nmap k <Plug>(easymotion-overwin-f2)

" Ctags
nnoremap )è <C-]>
nnoremap è) <C-o>

" UltiSnips
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<S-tab>'

" Vim Arpeggio "{{{
call arpeggio#map('i', '', 0, 'CDN', '<Esc>:r !grep ~/.vim/templates/CDN')
call arpeggio#map('i', '', 0, 'bt', '<button class="btn btn-default" type="submit">Button</button>')
call arpeggio#map('i', '', 0, 'jk', '<Esc>')
call arpeggio#map('i', '', 0, 'jk', '<Esc>')
call arpeggio#map('i', '', 0, 'jk', '<Esc>')
"}}}

" Vim Autoclose
inoremap <leader>a <C-o>:AutoCloseToggle<CR>

" Vundle
nnoremap <leader>vi :PluginInstall<CR>

" Netrw

" }}}
" }}}

" Divers {{{

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

" }}}

" Autocommand {{{

"---------------Auto-Commands---------------"

" Open a NERDTree automatically when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the  only window  left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Automatically source the Vimrc file
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup end

autocmd BufNewFile,BufRead *.vue set filetype=html.vue

" Folding
au BufWritePost,BufLeave,WinLeave ?* mkview
au BufEnter ?* silent loadview

" Fix the filetype for .md files.
"augroup MarkDownType
"    autocmd!
"    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
"augroup end
" }}}

" Abbreviations {{{

	"---------------Abbreviations---------------"

	" Fonction pour supprimer l'espace ajouté à la fin
	func! Eatchar(pat)
		let c = nr2char(getchar(0))
		return (c =~ a:pat) ? '' : c
	endfunc

	:iab box1 ╔════════════════════╗<CR>║        ║<CR>╚════════════════════╝<Up><Left><Left>

	inoremap 4 ()<Left>
	inoremap 44 ();<Left><Left>
  inoremap ' ''<Left>
	inoremap '' ('')<Left><Left>
	inoremap ''' ('');<Left><Left><Left>
  inoremap 1 ""<Left>
	inoremap 11 ("")<Left><Left>
	inoremap 111 ("");<Left><Left><Left>
	inoremap [ []<Left>
	inoremap [[ [];<Left><Left>
	inoremap [" [""]<Left><Left>
	inoremap ]" [""];<Left><Left><Left>
	inoremap { {}<Left>
	inoremap {{ {<CR><CR>}<Up>
	inoremap b" =""<Left><C-R>=Eatchar('\s')<CR> 
	inoremap "> "";<Left><Left><C-R>=Eatchar('\s')<CR>
	inoremap ;; :<Space>;<Left><C-R>=Eatchar('\s')<CR>
	inoremap == <Space>=<Space>;<Left><C-R>=Eatchar('\s')<CR>
	inoremap ==" <Space>=<Space>"";<Left><Left><C-R>=Eatchar('\s')<CR>

  inoremap <leader>mh {{<space><space><space>}}<C-o>F{<Right><Right>
" }}}
