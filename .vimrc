execute pathogen#infect()
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufRead,BufNewFile *.hamlc setfiletype haml
autocmd! BufRead,BufNewFile *.nghaml setfiletype haml
autocmd! BufRead,BufNewFile seeds.rb setfiletype txt

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'dense-analysis/ale'
Plug 'justinmk/vim-sneak'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'roman/golden-ratio'
Plug 'onemanstartup/vim-slim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'hashivim/vim-terraform'
call plug#end()


set tabstop=4
set softtabstop=2
set shiftwidth=2
set incsearch
set expandtab
set number
set nowrap
set gdefault
:syntax on
set background=dark
let g:solarized_menu=0
let g:solarized_termtrans=1
colorscheme solarized
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
set laststatus=2
set t_Co=256
set backspace=indent,eol,start
filetype plugin indent on
set regexpengine=2
set virtualedit=block
set wildmenu
set wildmode=longest,list
set splitbelow
set splitright
set autoindent
let g:ackprg = 'rg --vimgrep --no-heading'

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})


let mapleader=" "
nnoremap n nzz
nnoremap N Nzz
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap K <nop>
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap Y y$
nnoremap <NUL> :Ack! 
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>v :vsp 
nnoremap <Leader>s :sp 
nnoremap <Leader>q :q<CR>
nnoremap <Leader>a :all<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>m :FZFMru<CR>
" nnoremap <Leader>h <C-w>H
" nnoremap <Leader>j <C-w>J
" nnoremap <Leader>k <C-w>K
" nnoremap <Leader>l <C-w>L
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set rtp+=$HOMEBREW_PREFIX/opt/fzf

let g:fzf_mru_ignore_patterns = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:sneak#label = 1

let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['mri', 'rubocop']}
let g:ale_linter_aliases = {'javascript.jsx': 'javascript', 'jsx': 'javascript'}

let g:sql_type_default = 'pgsql'

noremap ; :
noremap : ;
vnoremap // y/<C-R>"<CR>

set nocompatible
filetype off

let &runtimepath.=',~/.vim/bundle/ale'

filetype plugin on

map f <Plug>Sneak_s
map F <Plug>Sneak_S

" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

if &term =~ '^xterm'
  " normal mode
  let &t_EI .= "\<Esc>[0 q"
  " insert mode
  let &t_SI .= "\<Esc>[6 q"
endif
