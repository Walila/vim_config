
let mapleader = "z"


call plug#begin()
"Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'

Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'shmargum/vim-sass-colors'
Plug 'vim-test/vim-test'
call plug#end()

autocmd BufReadPre,BufNewFile * let b:did_vim_sass_colors = 1

filetype plugin indent on


" set nocompatible
set hidden
set noswapfile
set nobackup
set nowritebackup
set colorcolumn=80

set updatetime=300

syntax on
" set term=screen-256color-s
" colorscheme burnttoast256
colorscheme gruvbox
set background=dark

set foldmethod=indent
set foldlevel=99
set autoindent
set smartindent
set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set showmatch
set number
set relativenumber
set confirm
set nowrap
set fo-=t
set encoding=utf-8
set scrolloff=8

set guioptions-=r
set guioptions-=L
set guioptions-=b
set noerrorbells
set novisualbell
set guifont=Monaco:h13

set ignorecase
set smartcase
set incsearch
set hlsearch
set cursorline
set cursorcolumn
set cmdheight=2
set laststatus=2

nnoremap <silent> <leader>fh :nohl<CR>

set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <space> za
nmap <silent> <leader>n :bn<CR>
nmap <silent> <leader>p :bp<CR>
nmap <silent> <leader>w :bw<CR>
nmap <silent> <leader>c :tabclose<CR>

vnoremap < <gv
vnoremap > >gv

nnoremap <silent> <leader>so :source ~/.config/nvim/init.vim<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme='gruvbox'

let g:ackprg = 'ag --vimgrep'

"export FZF_DEFAULT_COMMAND='git ls-files'
nmap <silent> <C-P> :FZF<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fb :BLines<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fa :Ag<CR>
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)

nmap <silent> ++ :NERDTreeToggle<CR>
let NERDTreeWinSize=25
let NERDTreeIfnore=['\.pyc','\~$','\.swp']
let NERDTreeShowHidden=1

nmap <leader>rr <Plug>(coc-rename)
"xmap <leader>m <Plug>(coc-format)
"nmap <leader>m <Plug>(coc-format)
xmap <leader>m <Plug>(coc-format-selected)
nmap <leader>m <Plug>(coc-format-selected)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
xmap <leader>a <Plug>(coc-codeaction-selected)
"nmap <leader>a <Plug>(coc-codeaction-selected)
"nmap <leader>ac  <Plug>(coc-codeaction)
"nmap <leader>qf  <Plug>(coc-fix-current)

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr><CR> pumvisible() ? "\<C-Y>" : "\<CR>"

nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <ESC>:w<CR>a

" vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

nnoremap <leader>, :MaximizerToggle!<CR>
nnoremap <F3> :call vimspector#Reset()<CR>
tnoremap <s-Esc> <C-\><C-n>
"if has('nvim')
    "tnoremap <Esc> <C-\><C-n>
    "tnoremap <C-v><Esc> <Esc>
"endif

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css,*.yaml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

"let test#strategy = "Neoterm"
let test#neovim#term_position = "topleft"
let test#neovim#term_position = "vert"
let test#neovim#term_position = "vert botright 30"
let test#python#runner = 'pytest' 
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

nnoremap <silent> <leader>j :res +5<CR>
nnoremap <silent> <leader>k :res -5<CR>
nnoremap <silent> <leader>h :vertical resize +5<CR>
nnoremap <silent> <leader>l :vertical resize -5<CR>

"set statusline^=%{coc#status()}%{get(b:,'coc_current_function',''
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
