" plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'rpopic2/nvim-cursorline'
Plug 'rpopic2/authentic-gh.vim'
Plug 'rpopic2/unity.vim'
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'
Plug 'puremourning/vimspector'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-lua/plenary.nvim'
" Plug 'ThePrimeagen/harpoon'
" lang specific
" Plug 'preservim/vim-markdown'
" Plug 'rust-lang/rust.vim'
call plug#end()

" source ~/.config/nvim/plugins/treesitter.lua
source ~/.config/nvim/lsp.lua
hi @lsp.type.struct.cs ctermfg=Blue

colorscheme gh-light
map <cr>\ :colorscheme gh-light<cr>
set colorcolumn=81
hi ColorColumn ctermfg=Red ctermbg=none

" coc related settings
set updatetime=300
set signcolumn=yes
set encoding=utf-8
" source ~/.config/nvim/cocinit.vim

" status line
set statusline=%w%h%r%q%t%m
set statusline+=%=%<
" set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=[%l,%P]%y

" general setings
set mouse=a
set clipboard+=unnamedplus
set timeoutlen=500
let g:loaded_perl_provider = 0
" tab settings
set tabstop=4 "How many columns of whitespace is a \t char worth
set shiftwidth=4 "How many columns of whitespace a 'level of indentation' is worth?
set softtabstop=4 "How many columns of whitespace is a tab keypress of a backspace keypress worth
set expandtab "You never want to see a \t again in your file, rather tabs keypresses will be expanded into spaces
"shows trailling whitespaces
set list listchars=trail:·,tab:\ \ 
imap <c-d> <del>
set completeopt=menu,longest

" key bindings

    "vim
map <space><space> :
map <space>w :w<cr>
map <space>t :tabnew<cr>
map <space>T :tabnew<cr><c-o>
map <space>l :tabonly<cr>
map <space>x :te<cr>i
map <space>m :tabmove 
map <space>g :G 
map <c-w>1 :tabmove 1<cr>
map <c-w>2 :tabmove 2<cr>
map <c-w>0 :tabmove 0<cr>
map \l :set bg=light<cr>
map \d :set bg=dark<cr>
map <c-k> :Man<cr>
map gD :tabnew<cr><c-o><c-]>
tmap <c-\> <c-\><c-n>


    "fzf.vim
map <space>f :Files!<cr>
map <cr>g :GitFiles!<cr>
map <cr>d :GitFiles!?<cr>
map <cr>c :BCommits<cr>
map <cr>C :Commits<cr>
map <cr>b :Buffers<cr>
map <cr>T :Tags<cr>
map <cr>a :Ag todo<cr>
map <cr><cr> :BLines<cr>
map <cr>l :Lines<cr>
map <cr>hh :History<cr>
map <cr>h/ :History/<cr>
map <cr>h: :History:<cr>
map <cr>H :Hel!<cr>
map <cr>m :Marks<cr>
map <cr>: :Commands<cr>
let g:fzf_preview_window = ['right,50%,<70(up,40%)', 'ctrl-\']

map <cr>n :NERDTreeToggle<cr>
map <cr>t :TagbarToggle<cr>

    " korean
map ㅗ h
map ㅓ j
map ㅏ k
map ㅣ l
map ㅐ o
map ㅒ O
map ㅑ i


    "rc's
map \rc :e $MYVIMRC<cr>
map \rcc :e ~/.config/nvim/cocinit.vim<cr>
map \rcl :e ~/.config/nvim/lsp.lua<cr>
map \rcg :e ~/.config/nvim/ginit.vim<cr>

" parantheses matching
ino {<cr> <c-g>u{<cr>}<esc>O
ino {<s-cr> <c-g>u{<cr>}<esc>O
nor { s<cr>{<cr><esc>o}<esc>
nmap } cs{xkJJ
vno } Jcs{x

" custom scrolling
nno zj <c-e>j
nno zk <c-y>k

" comments
aug slashes
    au!
    au BufEnter *.{cpp,c,cs,rs} map // ^i// <esc>
    au BufEnter *.{cpp,c,cs,rs} map ?? ^xxx
    au FileType cs setlocal commentstring=//%s
aug end
aug sharp_slashes
    au!
    au BufEnter *.{vim,sh,bashrc} map // ^i# <esc>
    au BufEnter *.{vim,sh,bashrc} map ?? ^xx
aug end


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
    min_length = 1,
    hl = { ctermbg = Black },
  }
}
EOF

" vimspector

let g:vimspector_enable_mappings='HUMAN'

" harpoon
map <space>h :lua require("harpoon.ui").toggle_quick_menu()<cr>
map <cr>h :lua require("harpoon.mark").add_file()<cr>

