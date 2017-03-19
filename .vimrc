set nocompatible              " be iMproved, required

let mapleader = ","

" enable syntax and plugins (for netrw)
syntax enable
filetype on
filetype plugin on
filetype indent on                  

set hlsearch		" surligne les résultats de recherche

set shiftwidth=2	" how many columns text is indented with the reindent operations (<< and >>)

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

" Theme PaperColor
set background=light
colorscheme summerfruit256

" Activer ou désactiver le mode Paste avec <F2> pour coller du texte sans formatage
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Coller avec le registre "0
nnoremap <F3> "0p

" afficher/masquer le surlignement des résultats d'une recherche avec ctrl+n
" en mode normal
function ToggleHLSearch()
	if &hls
		set nohls
	else
		set hls
	endif
endfunction


" ctrl + n en mode normal pour permuter le surlignage sur les termes d'une recherche
nmap <silent> <C-n> <Esc>:call ToggleHLSearch()<CR>

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

:imap jk <ESC>
:vmap jk <ESC>

" indentation automatique de l'ensemble du document
nmap <leader>b ggv<S-g>=''
imap <leader>b <Esc>ggv<S-g>=''i

" Déplacement window
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Entourer un mot de simples quotes, doubles quotes, chevrons, crochets, accolades
nnoremap <leader>' bi'<Esc>ea'<Esc>
nnoremap <leader>" bi"<Esc>ea"<Esc>
inoremap <leader>" <C-o>b"<C-o>e<Right>"
nnoremap <leader>( bi(<Esc>ea)<Esc>
inoremap <leader>( <C-o>b(<C-o>e<Right>)

" Raccourcis touche <leader> ,
" Enregistrement avec ;
nnoremap <leader>; <Esc>:w<CR>
" complétion avec n
inoremap <leader>n <C-n>
" coller le registre "* avec p
inoremap <leader>p <C-o>"*p
nnoremap <leader>p "*p

" Raccourcis déplacements
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
inoremap CC <Esc>C
inoremap SS <Esc>S
inoremap DD <Esc>dd
inoremap UU <Esc>ui

" Déplacement par n° de ligne
nnoremap § G
vnoremap § G

" space
nnoremap <Space> i<Space><Esc><Right>
" backspace
nnoremap <BS> i<BS><Right><Esc>
nmap <C-_> <BS>
inoremap <C-_> <BS>
" cariage return
nnoremap <CR> i<CR><Esc>
nnoremap <F8> O<Esc>
nnoremap <F9> o<Esc>

" Déplacement de lignes ou de bloc
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" map de la touche altgr + l en backspace
inoremap <Char-322> <BS>
nnoremap <Char-322> <BS>

" Raccourcis onglets
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
nnoremap gr :tabprevious<CR>

" Abbréviations

:iab if if ()<CR>{<CR><CR>}
:iab else <CR>{<CR><CR>}<Up><Up><Up><Up>
:iab for for (i = 0; i < ; i++)<CR>{<CR><CR>}
:iab switch switch()<cr>{<CR>case : <CR>break;<CR><CR>case : <CR>break;<CR>}
:iab $(' $('').('', function()<CR>{<CR><CR>});
:iab function function ()<CR>{<CR><CR>}<C-o>3k<C-o>f(
:iab $(f $(function(){<CR><CR>});<C-o>k
:ab #b /*********************************************
:ab #e *********************************************/
:iab ( ()<C-h>
:iab { {}<C-h>
:iab <!-- <!--<Space><Space>--><Left><Left><Left><Left><Left>

:autocmd VimEnter * DoShowMarks!		" exécute la commande DoShowMarks! pour afficher la barre des marques au lancement d'un fichier, elle s'affichera dès la 1ère marque posée

