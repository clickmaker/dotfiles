" neobundle settings {
if has('vim_starting')
  set nocompatible
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle start 
  NeoBundleFetch 'Shougo/neobundle.vim'

  " window control
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'Xuyuanp/nerdtree-git-plugin'
  NeoBundle 'rbgrouleff/bclose.vim'
  NeoBundle 'vim-airline/vim-airline'
  NeoBundle 'vim-airline/vim-airline-themes'

  " text helper
  NeoBundle 'junegunn/vim-easy-align'

  " color schemes
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'dsolstad/vim-wombat256i'
  NeoBundle 'junegunn/seoul256.vim'
  NeoBundle 'jtai/vim-womprat'
" neobundle end

NeoBundleCheck
call neobundle#end()
filetype plugin indent on
" } neobundle settings

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

syntax on
colorscheme womprat

set shiftwidth=4
set expandtab
set autoindent
set tabstop=4

set number

set list

set listchars=tab:>\ ,trail:-,extends:>,precedes:<

" nerdtree
map <C-m><C-m> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "!",
    \ "Renamed"   : ">",
    \ "Unmerged"  : "-",
    \ "Deleted"   : "x",
    \ "Dirty"     : "!",
    \ "Clean"     : "o",
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

