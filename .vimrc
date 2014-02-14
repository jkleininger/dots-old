runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()

let g:bufferline_echo = 0

colorscheme xoria256
syntax on
set guifont=Terminus\ 8
set guioptions=aegimLt
set guioptions-=T
set guioptions-=m
set guioptions-=r

set noswapfile

set history=50
set mouse=a
set ruler
set termencoding=utf-8
set t_Co=256

set backspace=indent,eol,start

set number
set laststatus=2

set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set foldmethod=marker
set foldnestmax=10
set nofoldenable
set foldlevel=1

"relative numbering
"set rnu

set scrolloff=999

set encoding=utf-8

noremap  <C-A-t>     :TlistToggle<CR>

noremap  ;           :wall<cr>:bp<cr>
noremap  '           :wall<cr>:bn<cr>

inoremap <C-A-v>      <esc>"*p<return>i
noremap  <C-A-v>      "*p<return>
vnoremap <C-A-x>      "*d
vnoremap <C-A-c>      "*y

"noremap  <C-A-Up>   <PageUp>
"noremap  <C-A-Down> <PageDown>

nnoremap <silent>   <cr>       :noh<cr>

nnoremap <Up>       <C-Y>
nnoremap <Down>     <C-E>
nnoremap <Left>     <<
nnoremap <Right>    >>

noremap  <C-l>      :set relativenumber!<cr>

noremap  <f12>      :!zsh<cr>

nnoremap <C-S-Up>   :m-2<cr>==
nnoremap <C-S-Down> :m+1<cr>==
vnoremap <C-S-Up>   :m '<-2<CR>gv=gv
vnoremap <C-S-Down> :m '>+1<CR>gv=gv

nnoremap <Leader>w  :wall<cr>

nnoremap <Leader>l  :ls<cr>

noremap L           $
noremap H           ^

"moving between windows
nnoremap <C-A-Up>    <C-w><Up>
nnoremap <C-A-Down>  <C-w><Down>
nnoremap <C-A-Left>  <C-w><Left>
nnoremap <C-A-Right> <C-w><Right>


"eclim java
nnoremap <silent> <leader>i :JavaImport<cr>
nnoremap <silent> <leader>o :JavaImportOrganize<cr>
nnoremap <silent> <leader>t :ProjectTree<cr>
nnoremap <silent> <F6> :ProjectBuild<cr>
nnoremap <silent> <F7> :Java<cr>


set ignorecase
set hlsearch

set showmatch
set mat=3

map 0 ^

set listchars=trail:·,precedes:«,extends:»,tab:▸\ 
"set listchars=trail:·,precedes:«,extends:»,eol:·,tab:▸\ 
set list

"unused, inactive, active
hi TabLineFill ctermfg=White   ctermbg=Black
hi TabLine     ctermfg=Grey    ctermbg=Black
hi TabLineSel  ctermfg=Yellow  ctermbg=Black

set statusline =
set statusline +=%3*%y%*
"set statusline +=%5*%{&ff}%*
set statusline +=%4*\ %<%F%*
set statusline +=%2*%m%*
set statusline +=%1*%=%5l%*
set statusline +=%2*/%L%*
set statusline +=%1*%4v\ %*
set statusline +=%2*0x%04B\ %*

hi User1 guifg=#eea040 guibg=#333333
hi User2 guifg=#dd3333 guibg=#333333
hi User3 guifg=#ff66ff guibg=#333333
hi User4 guifg=#a0ee40 guibg=#333333
hi User5 guifg=#eeee40 guibg=#333333

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

"syntastic
let g:syntastic_java_checkers=['javac', 'checkstyle']

