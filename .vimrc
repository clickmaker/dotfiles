" neobundle settings {
if has('vim_starting')
  set nocompatible
  if !isdirectory(expand("~/.vim/bundle/"))
    echo "make dir bundle..."
    call system("mkdir ~/.vim/bundle")
  endif
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Neobundle block start

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

call neobundle#begin(expand('~/.vim/bundle/'))

let g:neobundle_default_git_protocol='https'

  " original on github
  NeoBundleFetch 'Shougo/neobundle.vim'

  " NeoBundle 'Shougo/vimproc', {
  "   \ 'build' : {
  "     \ 'windows' : 'make -f make_mingw32.mak',
  "     \ 'cygwin' : 'make -f make_cygwin.mak',
  "     \ 'mac' : 'make -f make_mac.mak',
  "     \ 'unix' : 'make -f make_unix.mak',
  "   \ },
  "   \ }

  " NeoBundle 'Shougo/vimshell'

  " Pathogen
  NeoBundle 'tpope/vim-pathogen'

  " file controll
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'ujihisa/unite-colorscheme'

  " window control
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'Xuyuanp/nerdtree-git-plugin'

  " buffer control
  "NeoBundle 'rbgrouleff/bclose.vim'
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
  " indent guids
  NeoBundle 'nathanaelkane/vim-indent-guides'
  " zencoding
  NeoBundle 'mattn/emmet-vim'
  " syntax check
  NeoBundle 'vim-syntastic/syntastic'
  NeoBundle 'evidens/vim-twig'
  NeoBundle '1000ch/syntastic-local-textlint.vim'
  " NeoBundle 'HerringtonDarkholme/yats.vim'
  NeoBundle 'leafgarland/typescript-vim'
  NeoBundle 'rcmdnk/vim-markdown'
  " align
  NeoBundle 'junegunn/vim-easy-align'
  " editconfig
  NeoBundle 'editorconfig/editorconfig-vim'
  " git sign
  NeoBundle 'airblade/vim-gitgutter'
  " local vimrc
  NeoBundle 'embear/vim-localvimrc'
  " copilot
  NeoBundle 'github/copilot.vim'

  " markdown preview
  " - install yarn
  " - cd ~/.vim/bundle/markdown-preview.nvim/app
  " - yarn install
  NeoBundle 'iamcco/markdown-preview.nvim'

  " yaml folding
  NeoBundle 'pedrohdz/vim-yaml-folds'
  " esa
  NeoBundle 'upamune/esa.vim', {'depends': 'mattn/webapi-vim'}

  NeoBundle 'mattn/vim-chatgpt'
call neobundle#end()
" Neobundle block end

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Pathogen
if isdirectory(expand('~/.vim/bundle/neobundle/vim-pathogen'))
 call pathogen#infect('~/.vim/bundle/pathogen')
 call pathogen#helptags()
endif

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

" clicpboard
set clipboard+=unnamed

" leader
let mapleader = ","

" encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set fileformats=unix,dos,mac

" color
syntax on
set background=dark
if isdirectory(expand("~/.vim/bundle/vim-womprat/"))
  colorscheme womprat
endif

" tab indent
set shiftwidth=4
set expandtab
set tabstop=4
set smarttab
set autoindent
set smartindent
autocmd FileType yaml IndentGuidesEnable

set number
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
set smartcase
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
let g:NERDTreeGitStatusIndicatorMapCustom = {
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

" Buffre Close
nnoremap <Leader>d :bp<bar>sp<bar>bn<bar>bd<bar>bn<CR>
" Chrome Reload
nnoremap <Leader>r :ChromeReload<CR><C-l>
" let g:user_emmet_leader_key='<c-t>'
nnoremap <Leader>c :SyntasticCheck<CR>

nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>

cmap mdp MarkdownPreview

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" PHP
let g:PHP_vintage_case_default_indent = 1
let g:PHP_outdentphpescape = 0

" diff
if &diff
    " diff mode
    set diffopt+=iwhite
endif

" lcoal
let g:localvimrc_ask=0

" syntax check
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs=1

" let g:syntastic_mode_map = { 'mode': 'passive', 'passive_filetypes': ['ruby'] }
" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_ruby_rubocop_exe = 'rubocop'

set signcolumn=yes
let g:gitgutter_async = 1
let g:gitgutter_sign_modified = 'rw'
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow


let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['markdown', 'text'] }
let g:syntastic_markdown_checkers = ['textlint']
let g:syntastic_text_checkers = ['textlint']

set foldmethod=manual
let g:vim_markdown_folding_disabled = 1

autocmd FileType markdown let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']
autocmd FileType markdown inoremap <buffer> <C-J> <C-O>$<Space><Space><CR>

