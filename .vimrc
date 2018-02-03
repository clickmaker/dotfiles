" neobundle settings {
if has('vim_starting')
  set nocompatible
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Neobundle block start

call neobundle#begin(expand('~/.vim/bundle/'))

let g:neobundle_default_git_protocol='https'

  " original on github
  NeoBundleFetch 'Shougo/neobundle.vim'

  NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
      \ 'windows' : 'make -f make_mingw32.mak',
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'mac' : 'make -f make_mac.mak',
      \ 'unix' : 'make -f make_unix.mak',
    \ },
    \ }

  NeoBundle 'Shougo/vimshell'

  " file controll
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'ujihisa/unite-colorscheme'

  " window control
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'Xuyuanp/nerdtree-git-plugin'

  " buffer control
  NeoBundle 'rbgrouleff/bclose.vim'
  "NeoBundle 'vadimr/bclose.vim'
  NeoBundle 'vim-airline/vim-airline'
  NeoBundle 'vim-airline/vim-airline-themes'

  " color schemes
  NeoBundle 'w0ng/vim-hybrid'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'dsolstad/vim-wombat256i'
  NeoBundle 'junegunn/seoul256.vim'
  NeoBundle 'jtai/vim-womprat'

  " input helper
  " zencoding
  NeoBundle 'mattn/emmet-vim'
  " syntax check
  NeoBundle 'scrooloose/syntastic'
  " align
  NeoBundle 'junegunn/vim-easy-align'

" neobundle end

NeoBundleCheck
call neobundle#end()
" Neobundle block end

filetype plugin indent on

let s:is_windows =  has('win16') || has('win32') || has('win64')
let s:is_cygwin  =  has('win32unix')
let s:is_cui     = !has('gui_running')

if s:is_cygwin
  if &term =~# '^xterm' && &t_Co < 256
    set t_Co=256  " Extend terminal color of xterm
  endif
  if &term !=# 'cygwin'  " not in command prompt
    " Change cursor shape depending on mode
    let &t_ti .= "\e[1 q"
    let &t_SI .= "\e[5 q"
    let &t_EI .= "\e[1 q"
    let &t_te .= "\e[0 q"
  endif
else
  set t_Co=256
endif

" color
syntax on
set background=dark
colorscheme womprat

" tab indent
set shiftwidth=4
set expandtab
set tabstop=4
set smarttab
set autoindent
set smartindent

" frames
" status line
" set statusline=%n\ %f%m\ [%{&ff},%Y,%{(&fenc!=''?&fenc:&enc)},%l/%L(%p%%),%{getfsize(expand('%%:p'))}byte]
" set laststatus=2

" cursor
set backspace=eol,indent,start
set wildmode=list:longest
set nrformats=""
noremap j gj
noremap k gk

" search
set ignorecase
set incsearch
set hlsearch
set nowrapscan
nmap * *N

" special chars
set list
set listchars=tab:>\ ,trail:-,nbsp:%,extends:>,precedes:<

" zenkaku space
hi ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
set ambiwidth=double

" buffer
set nobackup
set noswapfile
set hidden
set splitbelow
set splitright

" nerdtree
map <C-m><C-m> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "!",
    \ "Staged"    : "+",
    \ "Untracked" : "*",
    \ "Renamed"   : ">",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "x",
    \ "Dirty"     : "!",
    \ "Clean"     : ".",
    \ "Unknown"   : "?"
    \ }

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='jellybeans'

" bclose
cmap bc Bclose

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" PHP
let g:PHP_vintage_case_default_indent = 1
let g:PHP_outdentphpescape = 0
