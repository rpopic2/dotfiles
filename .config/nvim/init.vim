if exists('g:vscode') 
    finish
endif
" plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'
Plug 'itchyny/vim-cursorword'
call plug#end()

"colorscheme corrections
set background=light
hi Pmenu ctermfg=White
hi NvimInternalError ctermfg=White
hi Visual ctermbg=Black
hi MatchParen ctermbg=Black
hi CursorColumn ctermfg=Black
hi CocListBgWhite ctermfg=Black
hi CocInlayHint ctermbg=Black
hi Conceal ctermbg=LightYellow
hi SignColumn ctermbg=None

"coc related settings
set updatetime=300
set signcolumn=yes
set encoding=utf-8
source ~/.config/nvim/cocinit.vim

"status line
set statusline+=%w%h%r%q%t%m
set statusline+=%=%<
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=%y


"rust related settings
syntax enable
filetype plugin indent on

"general setings
set mouse=a
set clipboard+=unnamedplus
set timeoutlen=500
"tab settings
set tabstop=4 "How many columns of whitespace is a \t char worth
set shiftwidth=4 "How many columns of whitespace a 'level of indentation' is worth?
set softtabstop=4 "How many columns of whitespace is a tab keypress of a backspace keypress worth
set expandtab "You never want to se a \t agains inyour file, rather tabs keypresses will be expanded into spaces

" key bindings

ino $$ <esc>A;<esc>
map <space><space> :
map <space>w :w<cr>
map <space>q :q<cr>
map <space>rc :e $MYVIMRC<cr>
map <space>rcc :e ~/.config/nvim/cocinit.vim<cr>
map <space>fi :Files<cr>
map <space>/ :noh<cr>

" parantheses matching
ino {<cr> <esc>i{<cr>}<esc>O
au BufNewFile,BufRead *.rs ino {<cr> {<cr>}<esc>O
