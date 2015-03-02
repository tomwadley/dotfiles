" To install vundle:
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" :BundleInstall (from inside vim)

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-surround'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/nerdtree'
Bundle 'fatih/vim-go'
Bundle 'wting/rust.vim'

set showcmd

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

colorscheme railscasts
set guioptions-=T  "remove toolbar

filetype plugin on
filetype plugin indent on
syntax enable

set autoindent
set smartindent

set showmatch

set tabstop=5
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

if version >= 700
  set spl=en spell
  set nospell
endif

set wildmenu
set wildmode=list:longest,full

set backspace=2

set number

set ignorecase
set smartcase

set incsearch
set hlsearch

if has('gui_running')
  nnoremap <silent> <esc> :nohlsearch<return><esc>
  set lines=45 columns=100
endif

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

set guifont="Ubuntu Mono R:size=11"

map <F5> :setlocal spell! spelllang=en_gb<CR>
map <F4> :NERDTreeToggle<CR>

hi Search guibg=peru guifg=wheat
hi Search cterm=NONE ctermfg=grey ctermbg=blue

let g:vim_markdown_folding_disabled=1
au BufRead,BufNewFile *.md set filetype=markdown

" split navigation with command-shift
map <D-H> <C-w>h
map <D-L> <C-w>l
map <D-J> <C-w>j
map <D-K> <C-w>k

" gradle syntax highlighting
au BufNewFile,BufRead *.gradle set filetype=groovy

autocmd Filetype go setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4

autocmd! GUIEnter * set vb t_vb=
