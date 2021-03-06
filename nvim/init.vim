"  _   _                 _             ____   ____
" | \ | | ___  _____   _(_)_ __ ___   |  _ \ / ___|
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \  | |_) | |
" | |\  |  __/ (_) \ V /| | | | | | | |  _ <| |___
" |_| \_|\___|\___/ \_/ |_|_| |_| |_| |_| \_\\____|
"
" init.vim, neovim config file, V1.3
" Chen Yudi, 2019.12

if !exists('g:vscode')

" ======= basic ======
set encoding=utf-8
"set nocompatible
" * nocompatible doesn't work in nvim?
set history=64
set ffs=unix

set nobackup
set noundofile
set noswapfile

filetype on
filetype plugin on
filetype indent on
let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python3"


" ==== appearance ====
"  colorscheme
"colorscheme molokai
"colorscheme xcodedark
colorscheme dracula
"  linenum
set nu
set rnu
"  wrap
set wrap
"  hilight
syntax on
set hlsearch
set incsearch
"  matches
set showmatch
set matchtime=2
"  scroll space
set scrolloff=4
"  cursorline
set cursorline
"set cursorcolumn
" --- modify colorscheme ---
"hi CursorLine   ctermbg=23666666
"hi Visual ctermfg=NONE ctermbg=242 cterm=NONE
hi Pmenu ctermfg=248 ctermbg=236 cterm=NONE
hi PmenuSel ctermfg=254 ctermbg=63 cterm=NONE
"hi PmenuSbar ctermfg=0 ctermbg=0 cterm=NONE
"hi PmenuThumb ctermfg=23 ctermbg=23 cterm=NONE
"hi VertSplit ctermfg=242 ctermbg=237 cterm=NONE
hi Normal ctermfg=254 ctermbg=None cterm=NONE
hi Cursor ctermfg=235 ctermbg=254 cterm=NONE
hi VertSplit ctermfg=61 ctermbg=None cterm=None
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE
" (be attention here, Normal::ctermbg=None results in transparent bg
" default is like: 'hi Normal ctermfg=254 ctermbg=235 cterm=NONE')
hi EndOfBuffer ctermfg=235 ctermbg=None cterm=NONE
" same as Normal, default is:
" 'hi EndOfBuffer ctermfg=235 ctermbg=235 cterm=NONE')
" -- to toggle between them --
let g:transparent_bg_stat = 1
function! s:transparent_bg_toggle ()
    if (g:transparent_bg_stat)
        hi Normal ctermfg=254 ctermbg=235 cterm=NONE
        hi EndOfBuffer ctermfg=235 ctermbg=235 cterm=NONE
    else
        hi Normal ctermfg=254 ctermbg=None cterm=NONE
        hi EndOfBuffer ctermfg=235 ctermbg=None cterm=NONE
    endif
    let g:transparent_bg_stat = !g:transparent_bg_stat
endfunction
command! ToggleTransparentBg call s:transparent_bg_toggle()

" ==== behaviour ====
" mouse
"set mouse=a
"  indent
set autoindent
set smartindent
" tab-space
set softtabstop=4
set tabstop=4
set shiftwidth=4
"set smarttab
set expandtab
" search case
set ignorecase
set smartcase
" redraw
"set lazyredraw
" list (blacnk space)
set list
set listchars=tab:▸\ ,trail:◪
" chdir
set autochdir
"  Leader
let mapleader = " "


" ===== key map ======
" --- matches ---
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O<TAB>
"inoremap { {}<ESC>i
nnoremap ; :
nnoremap W :w<CR>
nnoremap Q :q<CR>

" --- splits(window) ---
" split
nmap <Leader>sh :set nosplitright<CR>:vsplit<CR>
nmap <Leader>sl :set splitright<CR>:vsplit<CR>
nmap <Leader>sk :set nosplitbelow<CR>:split<CR>
nmap <Leader>sj :set splitbelow<CR>:split<CR>
" change layout
nmap <Leader>sV <C-w>t<C-w>H
nmap <Leader>sH <C-w>t<C-w>K
" switch
"nmap <Leader>h  <C-w>h
"nmap <Leader>l  <C-w>l
"nmap <Leader>k  <C-w>k
"nmap <Leader>j  <C-w>j
" use universal key binding: <M-S-dir>
nnoremap <C-M-h> <C-w>h
nnoremap <C-M-l> <C-w>l
nnoremap <C-M-k> <C-w>k
nnoremap <C-M-j> <C-w>j
inoremap <C-M-h> <Esc><C-w>ha
inoremap <C-M-l> <Esc><C-w>la
inoremap <C-M-k> <Esc><C-w>ka
inoremap <C-M-j> <Esc><C-w>ja
tnoremap <C-M-h> <C-\><C-n><C-w>ha
tnoremap <C-M-l> <C-\><C-n><C-w>la
tnoremap <C-M-k> <C-\><C-n><C-w>ka
tnoremap <C-M-j> <C-\><C-n><C-w>ja
" resize
nmap <Leader>ssh :vertical resize+5<CR>
nmap <Leader>ssl :vertical resize-5<CR>
nmap <Leader>ssk :res +5<CR>
nmap <Leader>ssj :res -5<CR>

" --- tab page ---
" new / close tab
map <Leader>tn :tabe<Space>
map <Leader>tc :tabc<CR>
map <silent><Leader>tl :tabs<CR>
" switch
map <silent><Leader>[ :tabn<CR>
map <silent><Leader>] :tabp<CR>

" --- buffers ---
map <Leader>bn :badd<Space>
map <silent><Leader>bc :bwipe<CR>
map <silent><Leader>bl :ls<CR>

" --- move line up/down, <Meta> <-- <Alt> ---
nnoremap <M-Up> ddkP
nnoremap <M-Down> ddp

" --- quik move ---
" normal
nnoremap H 10h
nnoremap J 5j
nnoremap K 5k
nnoremap L 10l
nnoremap <M-S-h> ^
nnoremap <M-S-l> $
" visual
vnoremap H 10h
vnoremap J 5j
vnoremap K 5k
vnoremap L 10l
nnoremap <M-S-h> ^
nnoremap <M-S-l> $
" insert
inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>
inoremap <M-S-h> <Esc>I
"inoremap <M-S-l> <Esc>A
inoremap <M-S-l> <End>
" terminal
tnoremap <M-h> <Left>
tnoremap <M-j> <Down>
tnoremap <M-k> <Up>
tnoremap <M-l> <Right>

" --- <Esc>, back to normal  mode ---
inoremap jk <Esc>
" stop using 'jk' as <Esc> and use <C-[> instead
"vnoremap jk <Esc>
tnoremap <M-\> <C-\><C-n>

" --- actions ---
" * sudo write
"map <Leader>-wsu :w !sudo tee %
" * reload vimrc
"map <Leader>-rerc :source ~/.config/nvim/init.vim
" * open terminal
"map <Leader>term :terminal<CR>
" * find anchor <-?-> and replace
"map <Leader>fa <Esc>/<-?-><CR>d5i

"  delete current Line
"nnoremap <C-K> <Esc>ddi
"  delete till eol
"nnoremap <C-k> <Esc>d$a
"nnoremap <C-j> J
"nnoremap <C-k> d$

" indent
"inoremap <C-[> <Esc><<i
"inoremap <C-]> <Esc>>>i


" ====== plugins ======

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release',  'do': { -> coc#util#install()}}

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

"Plug 'airblade/vim-gitgutter'

Plug 'junegunn/vim-peekaboo'

call plug#end()

" --- Poerline ---
""let g:powerline_pycmd = "py3"
""set rtp+=/usr/share/powerline/bindings/vim
""set laststatus=2
""set noshowmode
""set t_Co=256
""let g:minBufExplForceSyntaxEnable = 1
""python3 from powerline.vim import setup as powerline_setup
""python3 powerline_setup()
""python3 del powerline_setup

" --- Airline ---
set laststatus=2
"let g:airline_theme = 'base16_snazzy'
"let g:airline_theme = 'dracula'
let g:airline_theme = 'my_snazzy'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline_extensions = ['branch', 'coc', 'quickfix', 'term', 'whitespace', 'wordcount']

" -- COC ---
" see: https://github.com/neoclide/coc.nvim/wiki/Using-snippets#configure-snippets-workflow
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'
" * ref: https://github.com/neoclide/coc.nvim/blob/master/Readme.md
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
"set nobackup
set nowritebackup
" Better display for messages
"set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=200
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Using CocList
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" --- NERDTree ---
nnoremap <Leader>tt :NERDTreeToggle<CR>
"autocmd VimEnter * if argc() == 0 | NERDTree | endif
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'

endif " !exists('g:vscode')

