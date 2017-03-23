set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
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

"---------------Visuals---------------"
set background=light
colorscheme summerfruit256

" afficher/masquer le surlignement des résultats d'une recherche avec ctrl+n
" en mode normal
function! ToggleHLSearch()
	if &hls
		set nohls
	else
		set hls
	endif
endfunction

"---------------Mappings---------------"

" Raccourci pour éditer le fichier .vimrc
nmap ,ev :e $MYVIMRC<CR>

" Activer ou désactiver le mode Paste avec <F2> pour coller du texte sans formatage
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Coller avec le registre "0
nnoremap <F3> "0p

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
 
:iab bonjour hello!!!
:iab if! if ()<CR>{<CR><CR>}
:iab else! else<CR>{<CR><CR>}<C-o>2k
:iab for! for (i = 0; i < ; i++)<CR>{<CR><CR>}
:iab switch! switch()<cr>{<CR>case : <CR>break;<CR><CR>case : <CR>break;<CR>}
:iab $('! $('').('', function()<CR>{<CR><CR>});
:iab function! function ()<CR>{<CR><CR>}<C-o>3k<C-o>f(
:iab $(f! $(function(){<CR><CR>});<C-o>k
:ab #b /*********************************************
:ab #e *********************************************/
:iab ( ()<C-h>
:iab { {}<C-h>
:iab <!-- <!--<Space><Space>--><Left><Left><Left><Left><Left>

"---------------Auto-Commands---------------"

" Automatically source the Vimrc filave
augroup autosourcing
			autocmd!
			autocmd BufWritePost .vimrc source %
augroup end

:autocmd VimEnter * ShowMarksOn		" exécute la commande DoShowMarks! pour afficher la barre des marques au lancement d'un fichier, elle s'affichera dès la 1ère marque posée


