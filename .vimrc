execute pathogen#infect()
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufRead,BufNewFile *.hamlc setfiletype haml
autocmd! BufRead,BufNewFile *.nghaml setfiletype haml
autocmd! BufRead,BufNewFile seeds.rb setfiletype txt

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
set rtp+=~/.powerline/powerline/bindings/vim/
set laststatus=2
set t_Co=256
set backspace=indent,eol,start
filetype plugin indent on
set regexpengine=1
set virtualedit=block
set wildmenu
set wildmode=longest,list
set splitbelow
set splitright

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
nnoremap <NUL> :CtrlPMRU<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>v :vsp 
nnoremap <Leader>s :sp 
nnoremap <Leader>q :q<CR>
nnoremap <Leader>a :all<CR>
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

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
nmap s <Plug>(easymotion-overwin-f)

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

noremap ; :
noremap : ;
vnoremap // y/<C-R>"<CR>

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-v>'],
    \ 'AcceptSelection("v")': ['<cr>', '<2-LeftMouse>'],
    \ }
