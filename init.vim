
let mapleader = "\<Space>"


call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'

Plug 'puremourning/vimspector'
Plug 'shmargum/vim-sass-colors'
Plug 'vim-test/vim-test'

Plug 'ntpeters/vim-better-whitespace'
Plug 'frazrepo/vim-rainbow'
Plug 'easymotion/vim-easymotion'
Plug 'djoshea/vim-autoread'

Plug 'OmniSharp/omnisharp-vim'
Plug 'junegunn/vim-easy-align'
Plug 'dense-analysis/ale'
call plug#end()

filetype plugin indent on

set nocompatible
set hidden
set noswapfile
set nobackup
set nowritebackup
"set colorcolumn=0

set updatetime=300
set autoread

syntax on
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
nnoremap <leader>v <C-v>

set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"nnoremap <space> za
nmap <silent> <leader>n :bn<CR>
nmap <silent> <leader>p :bp<CR>
nmap <silent> <leader>w :bw<CR>
nmap <silent> <leader>c :tabclose<CR>

"vnoremap << <gv
"vnoremap >> >gv

nnoremap J mzJ`z
nnoremap Y y$
nmap n nzzzv
nmap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap H <gv
vnoremap L >gv

inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u


"function! MarkCodeBlock()
"    " Add Markdown code-block delimiters to begin and end of current visual group.
"    execute "normal! `<O```\<esc>yy`>p"
"endfunction
"
"xnoremap <leader>q :call MarkCodeBlock()<CR>
"
"function! FindAndReplaceAll(from, to)
"    echo a:from
"    exe %s/' . a:from . '/' . a:to . '/gc''
"endfunction




nmap <S-h> ^
nmap <S-l> $
"vmap " <Esc>bi"<Esc>wwi"
"vmap ' <Esc>bi'<Esc>wwi'
"vmap ( <Esc>bi(<Esc>wwi)
"vmap [ <Esc>bi[<Esc>wwi]
"vmap { <Esc>bi{<Esc>wwi}
"vmap < <Esc>bi<<Esc>wwi>

vmap " di"<Esc>pa"<Esc>va"
vmap ' di'<Esc>pa'<Esc>va'
vmap ( di(<Esc>pa)<Esc>va)
vmap [ di[<Esc>pa]<Esc>va]
vmap { di{<Esc>pa}<Esc>va}
vmap < di<<Esc>pa><Esc>va>

nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>

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

let g:NERDCommentEmptyLines = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

"let g:NERDTreeGitStatusIndicatorMapCustom = {
"\ "Modified"  : "✹",
"\ "Staged"    : "✚",
"\ "Untracked" : "✭",
"\ "Renamed"   : "➜",
"\ "Unmerged"  : "═",
"\ "Deleted"   : "✖",
"\ "Dirty"     : "✗",
"\ "Clean"     : "✔︎",
"\ "Unknown"   : "?"
"\ }

nmap <leader>rr <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
"xmap <leader>m <Plug>(coc-format)
"nmap <leader>m <Plug>(coc-format)
xmap <leader>m <Plug>(coc-format-selected)
nmap <leader>m <Plug>(coc-format-selected)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>b <C-o>

"autocmd FileType cs nmap <leader>gd :OmniSharpGotoDefinition<CR>
"autocmd FileType cs nmap <leader>gi :OmniSharpFindImplementations<CR>
"autocmd FileType cs nmap <leader>rr :OmniSharpRename<CR>
"autocmd FileType cs nmap <leader>m :OmniSharpCodeFormat<CR>
"autocmd FileType cs nmap <leader>gr :OmniSharpFindUsages<CR>
"autocmd FileType cs nmap <leader>rg :OmniSharpFixUsings<CR>


autocmd FileType cs
    \ nmap <leader>gd :OmniSharpGotoDefinition<CR> |
    \ nmap <leader>gi :OmniSharpFindImplementations<CR> |
    \ nmap <leader>rr :OmniSharpRename<CR> |
    \ nmap <leader>m :OmniSharpCodeFormat<CR> |
    \ nmap <leader>gr :OmniSharpFindUsages<CR> |
    \ nmap <leader>rg :OmniSharpFixUsings<CR> |
    \ nmap <leader>vd :OmniSharpPreviewDefinition<CR> |
    \ nmap <leader>vi :OmniSharpPreviewImplementation<CR> |
    \ nmap <leader>vr :OmniSharpGlobalCodeCheck<CR> |

"autocmd FileType cs nmap <leader>rg :OmniSharpFixUsings<CR>
"autocmd FileType cs nmap <leader>rg :OmniSharpFixUsings<CR>
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

nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
nnoremap <leader>sa :wa<CR>
"nnoremap <silent> <C-S-s> :wa<CR>
"inoremap <silent> <C-S-s> <ESC>:wa<CR>a

nnoremap <leader>ps :Git push<CR>
"inoremap <leader>ps <ESC>:Git push<CR>a
nnoremap <leader>pl :Git pull<CR>
"inoremap <leader>pl <ESC>:Git pull<CR>a
nnoremap <leader>ft :Git fetch<CR>
"inoremap <leader>ft <ESC>:Git fetch<CR>a
nnoremap <leader>mt :wa<CR>:Git commit -a -m ""<LEFT>
"inoremap <leader>mt <ESC>:Git commit -a -m ""<LEFT>
nnoremap <leader>di :Git diff<CR>
"inoremap <leader>di <ESC>:Git diff<CR>


" vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'


nnoremap <leader>, :MaximizerToggle!<CR>
nnoremap <leader>ve :VimspectorEval<Space>
nnoremap <leader>vw :VimspectorWatch<Space>
nnoremap <F4> :VimspectorReset<CR>
"tnoremap <s-Esc> <C-\><C-n>
nnoremap <leader>atw :call AddToWatch()<CR>
func! AddToWatch()
    let word = expand("<cexpr>")
    call vimspector#AddWatch(word)
endfunction

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    "\ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css,*.yaml,*.yml
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

nnoremap <leader>j :res +5<CR>
nnoremap <leader>k :res -5<CR>
nnoremap <leader>h :vertical resize +5<CR>
nnoremap <leader>l :vertical resize -5<CR>

"set statusline^=%{coc#status()}%{get(b:,'coc_current_function',''
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" for plugin sass-colors
autocmd BufReadPre,BufNewFile * let b:did_vim_sass_colors = 1

let g:better_whitespace_enable=1
let g:strip_whitespace_on_save=1

let g:better_whitespace_filetypes_blacklist=['<filetype1>', '<filetype2>', '<etc>', 'diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
autocmd FileType markdown DisableStripWhitespaceOnSave
nnoremap <silent> <leader>rs :StripWhitespace<CR>
let g:rainbow_active = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

let g:EasyMotion_smartcase = 1
nmap <leader><leader>S <plug>(easymotion-s2)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
"unction! s:config_easyfuzzymotion(...) abort
    "return extend(copy({
    "\   'converters': [incsearch#config#fuzzyword#converter()],
    "\   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
    "\   'keymap': {"\<CR>": '<Over>(easymotion)'},
    "\   'is_expr': 0,
    "\   'is_stay': 1
    "\ }), get(a:, 1, {}))
"endfunction

"noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.py mkview
    autocmd BufWinEnter *.py silent! loadview
augroup END

let g:ale_linters = {
     \ 'cs': ['omnisharp', 'csc'],
     \ 'python': ['flake8']
     \}

let g:OmniSharp_start_server = 1
let g:OmniSharp_loglevel = 'info'
let g:OmniSharp_server_display_loading = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_server_use_mono = 0
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_popup = 1
let g:OmniSharp_translate_cygwin_wsl = 1

"let g:polyglot_disabled = ['markdown']
"let g:ale_disable_lsp = 1
set omnifunc=ale#completion#OmniFunc
"let g:ale_completion_autoimport = 1
"let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"let g:coc_global_extentions=[ 'coc-OmniSharp' ]

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
