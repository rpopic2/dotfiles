" plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'rpopic2/authentic-gh.vim'
Plug 'preservim/tagbar'
call plug#end()

" source ~/.config/nvim/plugins/treesitter.lua
source ~/.config/nvim/lsp.lua


set notermguicolors
colorscheme gh-light
set colorcolumn=81
aug his
    au!
    au BufEnter *.al set filetype=al
    au ColorScheme hi gitcommitBlank ctermbg=None hi ColorColumn ctermfg=White ctermbg=none
    hi @lsp.type.struct.cs ctermfg=Blue
    hi diffRemoved ctermfg=Grey ctermbg=lightred
    hi diffAdded ctermbg=LightGreen
    hi diffFile ctermfg=Cyan
    hi csPreProcPragma ctermfg=Grey
aug end

hi Search ctermbg=LightYellow

set updatetime=300
set signcolumn=yes
set encoding=utf-8
set winborder=single

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
let g:loaded_ruby_provider = 0

" tab settings
set tabstop=4 "How many columns of whitespace is a \t char worth
set shiftwidth=4 "How many columns of whitespace a 'level of indentation' is worth?
set softtabstop=4 "How many columns of whitespace is a tab keypress of a backspace keypress worth
set expandtab "You never want to see a \t again in your file, rather tabs keypresses will be expanded into spaces

"show trailling whitespaces
set list listchars=trail:·,tab:\ \ 
inoremap <c-d> <del>
inoremap <c-b> <left>
inoremap <c-f> <right>
inoremap <c-x>l <c-x><c-l>
inoremap <c-x>o <c-x><c-o>
inoremap <c-x>n <c-x><c-n>
inoremap <c-x>p <c-x><c-p>
inoremap <c-x>f <c-x><c-f>
set completeopt=menuone,noinsert

" key binding

    "vim
map <space><space> :
map <space>w :w<cr>
map <space>t :tab split<cr>
map <space>T gT:tabnew<cr>
map <space>o :tabonly<cr>
map <space>x :te<cr>i
map <space>m :tabmove 
map <space>> 9<c-w>>
map <space>< 9<c-w><
map <space>q <c-w><c-w><c-w>q
map <space>g :tab G 
" map <space>gca :G fetch<cr>:tab G commit -a<cr>
map <space>j :cn<cr>zz
map <space>k :cN<cr>zz
" map <space>h :ln<cr>
map <c-w>1 :tabmove 1<cr>
map <c-w>2 :tabmove 2<cr>
map <c-w>0 :tabmove 0<cr>
map <c-w><space> <c-w>L12<c-w><
map <c-.> <c-w>>
map <c-,> <c-w><
map <c-k> :tab Man<cr>
map gD :tab split<cr><c-]>
map <left> gT
map <right> gt
map <M-h> gT
map <M-l> gt
" map gr gR<cr><space>q
tmap <c-\> <c-\><c-n>
map _ "_

map <up> <c-y>k
map <down> <c-e>j

"fzf.vim

let pred = ''
aug fzf_files
    au!
    au BufEnter *.* let pred = "-name \'*." . expand('%:e') . "\'"
aug end

map <space>c :call fzf#run({'source': 'find . ' . pred, 'sink': 'tabedit'})<cr>
map <space>e :call fzf#run({'source': 'find .', 'sink': 'e'})<cr>

call system("test -d Assets")
if v:shell_error == 0
    map <space>c :call fzf#run({'source': 'find Assets -name *.cs', 'sink': 'tabedit'})<cr>
endif

map <space>f :Files!<cr>
map <space>F :GitFiles!<cr>
map \g :GitFiles!?<cr>
map <space>d :tab G diff HEAD
map \c :BCommits<cr>
map \C :Commits<cr>
map <space>b :Buffers!<cr>
map \A :Ag! todo<cr>
map \a :Ag! 
map \<cr> :BLines<cr>
map \l :Lines<cr>
map \hh :History<cr>
map \h/ :History/<cr>
map \h: :History:<cr>
map \H :Hel!<cr>
map \m :Marks<cr>
map \: :Commands<cr>
map \b :hi gitcommitBlank ctermbg=none<cr>
let g:fzf_preview_window = ['right,50%,<70(up,40%)', 'ctrl-\']

map \n :NERDTreeToggle<cr>
map \t :TagbarToggle<cr>

cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
cmap <C-=> <Up>
cmap <C--> <Down>
set cedit=\<c-v>

    " korean
map ㅗ h
map ㅓ j
map ㅏ k
map ㅣ l
map ㅐ o
map ㅒ O
map ㅑ i
map ㅁ a
map ㄱ r


    "rc's
map \rc :e $MYVIMRC<cr>
map \rcc :e ~/.config/nvim/cocinit.vim<cr>
map \rcl :e ~/.config/nvim/lsp.lua<cr>
map \rcg :e ~/.config/nvim/ginit.vim<cr>

" parantheses matching
ino {<cr> <c-g>u{<cr>}<esc>O
ino {<s-cr> <c-g>u{<cr>}<esc>O
" nor { s<cr>{<cr><esc>o}<esc>
" nmap } cs{xkJJ
" vno } Jcs{x

" custom scrolling
nno zj <c-e>j
nno zk <c-y>k

setglobal commentstring=//\ %s
" comments
aug comments
    au!
    au BufEnter * map <space>/ gcc
    au BufEnter * map <space>? gcc

    au FileType vim setlocal commentstring=\"\ %s
    au FileType lua setlocal commentstring=--\ %s
    au FileType sh setlocal commentstring=#\ %s
aug end

