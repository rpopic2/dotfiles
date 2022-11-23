if exists('g:vscode') 
    finish
endif

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
hi SignColumn ctermbg=Black

"rust related settings
syntax enable
filetype plugin indent on

set mouse=a

set clipboard+=unnamedplus

set tabstop=4 "How many columns of whitespace is a \t char worth
set shiftwidth=4 "How many columns of whitespace a 'level of indentation' is worth?
set softtabstop=4 "How many columns of whitespace is a tab keypress of a backspace keypress worth
set expandtab "You never want to se a \t agains inyour file, rather tabs keypresses will be expanded into spaces

"key bindings
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>" 

map <space><space> :
map <space>f :Files<cr>

inoremap { {}<left>
inoremap {<cr> {<cr>}<esc>O
imap ( ()<left>
imap [ []<left>
imap < <><left>
