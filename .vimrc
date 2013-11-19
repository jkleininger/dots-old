colorscheme ir_black
syntax on
set guifont=Terminus\ 8
set guioptions=aegimLt
set guioptions-=T
set guioptions-=m
set guioptions-=r

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

noremap  <C-A-t>     :TlistToggle<CR>

noremap  <f1>        :tabp<CR>
noremap  <f2>        :tabn<CR>
noremap  <C-A-Left>  :tabp<CR>
noremap  <C-A-Right> :tabn<CR>

noremap  <C-d>       :!zsh<CR>

inoremap <C-v>      <esc>"*p<return>i
noremap  <C-v>      "*p<return>
vnoremap <C-x>      "*d
vnoremap <C-c>      "*y

noremap  <C-A-Up>   <PageUp>
noremap  <C-A-Down> <PageDown>

nnoremap <CR>       :noh<CR><CR>

set ignorecase
set hlsearch

set showmatch
set mat=3

map 0 ^

set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

"unused, inactive, active
hi TabLineFill ctermfg=White   ctermbg=Black
hi TabLine     ctermfg=Grey    ctermbg=Black
hi TabLineSel  ctermfg=Yellow  ctermbg=Black

set statusline =
"set statusline +=%5*%{&ff}%*
set statusline +=%3*%y%*
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

filetype plugin on
set omnifunc=syntaxcomplete#Complete
