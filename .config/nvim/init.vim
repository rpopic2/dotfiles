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
Plug 'yamatsum/nvim-cursorline'

call plug#end()

" rose-pine-light colorscheme corrections
if 0
    set background=light
    hi Pmenu ctermfg=White
    hi NvimInternalError ctermfg=White
    hi Visual ctermbg=Black
    hi CursorColumn ctermfg=Black
    hi CocListBgWhite ctermfg=Black
    hi Conceal ctermbg=LightYellow
endif
hi CocInlayHint ctermfg=Black
hi SignColumn ctermbg=None
hi MatchParen ctermbg=DarkGrey

" coc related settings
set updatetime=300
set signcolumn=yes
set encoding=utf-8
source ~/.config/nvim/cocinit.vim

" status line
set statusline+=%w%h%r%q%t%m
set statusline+=%=%<
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=%y


" rust related settings
syntax enable
filetype plugin indent on

" general setings
set mouse=a
set clipboard+=unnamedplus
set timeoutlen=500
" tab settings
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
ino {<cr> <esc>a{<cr>}<esc>O

" nvim cursorline
lua << EOF
require('nvim-cursorline').setup {
  cursorline = {
    enable = false,
    timeout = 0,
    number = true,
  },
  cursorword = {
    enable = true,
    min_length = 2,
    hl = { ctermbg = Black },
  }
}
EOF
