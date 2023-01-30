if exists('g:vscode') 
    finish
endif
" plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'yamatsum/nvim-cursorline'
Plug 'preservim/tagbar'
Plug 'preservim/vimux'
Plug 'preservim/nerdtree'
Plug 'github/copilot.vim'
" lang specific
Plug 'preservim/vim-markdown'
Plug 'rust-lang/rust.vim'
call plug#end()

" rose-pine-light colorscheme corrections
let color = split(execute('colorscheme'), '\n')
if color[0] ==? 'rose-pine-dark'
    set background=dark
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
" syntax enable
" filetype plugin indent on

" general setings
set mouse=a
set clipboard+=unnamedplus
set timeoutlen=500
" tab settings
set tabstop=4 "How many columns of whitespace is a \t char worth
set shiftwidth=4 "How many columns of whitespace a 'level of indentation' is worth?
set softtabstop=4 "How many columns of whitespace is a tab keypress of a backspace keypress worth
set expandtab "You never want to see a \t again in your file, rather tabs keypresses will be expanded into spaces
set nu rnu

" key bindings

    "vim
ino $$ <esc>A;<esc>
map <space><space> :
map <space>w :w<cr>
map <space>q :q<cr>
map <space>q! :q!<cr>
map <space>t :tabnew<cr>
map <space>T :tabnew<cr><c-o>
map <space>v :vsplit<cr>
map <space>s :split<cr>
map <space>/ :noh<cr>
map <space>r :registers<cr>
ino <c-u> <c-o>d^<del>

    "fzf.vim
map <cr>F :Files<cr>
map <cr>f :GitFiles<cr>
map <cr>g :GitFiles?<cr>
map <cr>c :BCommits<cr>
map <cr>C :Commits<cr>
map <cr>b :Buffers<cr>
map <cr>t :Tags<cr>
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
map <cr>v :VimuxOpenRunner<cr>

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
map \rcg :e ~/.config/nvim/ginit.vim<cr>

map <space>g :G<space>

" copilot
imap <silent><script><expr> <c-j> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true


" parantheses matching
ino {<cr> <c-g>u{<cr>}<esc>O
ino {<s-cr> <c-g>u{<cr>}<esc>O
nor { s<cr>{<cr><esc>o}<esc>
nmap } cs{xkJJ
vno } Jcs{x

" comments
aug slashes
    au!
    au BufEnter *.{cpp,c,cs,rs} map // ^i//<esc>
    au BufEnter *.{cpp,c,cs,rs} map ?? ^xx
aug end
aug sharp_slashes
    au!
    au BufEnter *.{vim,sh,bashrc} map // ^i#<esc>
    au BufEnter *.{vim,sh,bashrc} map ?? ^x
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
