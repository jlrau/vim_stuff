" start pathogen
runtime bundle/pathogen.vim/autoload/pathogen.vim
execute pathogen#infect()

" plugin install script:
" cd ~/.vim
" git clone https://github.com/tpope/vim-pathogen.git bundle/pathogen.git
" git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
" git clone https://github.com/itchyny/lightline.vim bundle/lightline.vim
" git clone https://github.com/scrooloose/nerdtree bundle/nerdtree.vim
" git clone https://github.com/jistr/vim-nerdtree-tabs bundle/nerdtree-tabs.vim
" git clone https://github.com/vim-scripts/wombat256.vim bundle/wombat256.vim

filetype plugin indent on

" normal backspace behaviour
set backspace=2

" enable syntax processing
syntax enable

"ui Config
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.

" gvim gui options
if has('win32')
" no tear
set guioptions-=t
" no toolbar
set guioptions-=T
" no scrollbar right
set guioptions-=r
" no tabs
set guioptions-=e
" no scrollbar left
set guioptions-=L
endif

" theme
syntax on
set t_Co=256
color wombat256mod

" set line at 80 chars
if has('win32')
highlight ColorColumn guibg=gray28
elseif has('unix')
highlight ColorColumn ctermbg=236
endif
set colorcolumn=80

" searching
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" leader shortcuts
let mapleader=","       " leader is comma
" toggle gundo
" nnoremap <leader>u :GundoToggle<CR>

" nerd-tree toggle
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
" ignore temp files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeMapOpenInTab='\r'
"stop opening on start
let g:nerdtree_tabs_open_on_gui_startup=0

" PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" UTF8 Support
set encoding=utf-8

" system clipboard
set clipboard=unnamed

" map save to ,w
noremap <leader>w :update<CR>

" map quit to ,q
noremap <leader>q :quit<CR>
noremap <leader>Q :qa!<CR>

" easier moving between tabs
nnoremap <Leader>n <esc>:tabprevious<CR>
nnoremap <Leader>m <esc>:tabnext<CR>
nnoremap <leader>t <esc>:tabnew<CR>

" Move code blocks
vnoremap < <gv
vnoremap > >gv

" Format paragraph
vmap Q gq
nmap Q gqap

" map sort function to ,s
vnoremap <leader>s :sort<CR>

" lightline start
set laststatus=2

" auto replace word in normal mode
nnoremap <leader>r *``cgn
" auto replace selection in visual mode
vnoremap <leader>r y/<C-R>"<CR>``cgn
" clear highlighted text on escape
nnoremap \\ :noh<return>
" write session
nnoremap <leader>S :mksession! ~/vim_session <CR>
" load session
nnoremap <leader>L :source ~/vim_session <CR>

" better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable arrow navigation
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
