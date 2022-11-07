call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'OmniSharp/omnisharp-vim'
Plug 'nickspoons/vim-sharpenup'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'maximbaz/lightline-ale'
Plug 'puremourning/vimspector'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
"Plug 'rpopic2/idarkmode.vim'
call plug#end()

" Settings: {{{
filetype indent plugin on
" if !exists('g:syntax_on') | syntax enable | endif
set encoding=utf-8
scriptencoding utf-8

set completeopt=menuone,noinsert,noselect,popuphidden,preview
set completepopup=highlight:Pmenu,border:off

set backspace=indent,eol,start
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=-1
set tabstop=8
set textwidth=80
set title

set hidden
set nofixendofline
set nostartofline
set splitbelow
set splitright

set hlsearch
set incsearch
set smartcase
set laststatus=2
set nonumber
set noruler
set noshowmode

set mouse=a
set updatetime=1000
set timeoutlen=260

" Mappings
" " OmniSharp
map gD :OmniSharpGotoDefinition tabedit<cr>
map <space>fm :OmniSharpFindMembers<cr>
" " Tab Manipulation
map <space>c :tabnew<CR>
map <space>C :tabnew<cr><c-o>
map <space>w :w<cr>
" " Git / fugitive.vim
map <space>g :G<space>
map <space>dif :!git diff
" " .vimrc
map <space>rc :e $MYVIMRC<CR>
map <space>rr :source $MYVIMRC<CR>
" " Parentheses autocompletion
imap {<CR> {<CR>}<esc>O
" " For Mobile
map <space><space> :
map <space>/ :noh<CR>
map $$ A;<esc>
map K :OmniSharpSignatureHelp<CR>
imap <c-k> map K :OmniSharpSignatureHelp<CR>
" " agenda
imap [<space> [<space>]<space>
noremap gx 2<bar>rXddggp<c-o>
noremap gv 2<bar>rv
" " Others
map <cr><cr> o<esc>

" "fzf.vim
map <cr>f :Files<cr>
map <cr>g :GFiles<cr>
map <C-g> :tabnew<cr>:GFiles<cr>
map <cr>G :GFiles?<cr>
map <cr>L :Lines<cr>
map <cr>l :BLines<cr>
map <cr>C :Commits<cr>
map <cr>c :BCommits<cr>
map <cr><space> :History:<cr>
map <cr>h :History<cr>
map <cr>H :History/<cr>
map <cr>m :Commands<cr>

"korean mode
map ㅁ a
map ㅠ b
map ㅊ c
map ㅇ d
map ㄷ e
map ㄹ f
map ㅎ g
map ㅗ h
map ㅑ i
map ㅓ j
map ㅏ k
map ㅣ l
map ㅡ m
map ㅜ n
map ㅐ o
map ㅔ p
map ㅂ q
map ㄱ r
map ㄴ s
map ㅅ t
map ㅕ u
map ㅍ v
map ㅈ w
map ㅌ x
map ㅛ y
map ㅋ z

" }}}

" commentary-vim
set commentstring=//%s
  

" ALE: {{{
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'

let g:ale_linters = { 'cs': ['OmniSharp'] }
" }}}

" Asyncomplete: {{{
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
autocmd VimEnter * inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" }}}

" Asyncomplete-ultisnips: {{{
let g:OmniSharp_want_snippet = 1
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsListSnippets="<c-b>"
call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'allowlist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/.ultisnips']
" }}}

" Sharpenup: {{{
let g:sharpenup_map_prefix = '<Space>'
let g:sharpenup_statusline_opts = {
\ 'TextLoading': ' O#: %s ~ (%p / %P) ',
\ 'TextReady': '#',
\ 'TextDead': ' O#: Not running ',
\ 'Highlight': 0,
\ 'HiLoading': 'SharpenUpLoading',
\ 'HiReady': 'SharpenUpReady',
\ 'HiDead': 'SharpenUpDead'
\}
augroup OmniSharpIntegrations
  autocmd!
  autocmd User OmniSharpProjectUpdated,OmniSharpReady call lightline#update()
augroup END
let g:sharpenup_codeactions = 0
" }}}

" OmniSharp: {{{
let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_selector_ui = 'fzf'
"let g:OmniSharp_selector_findmembers = 'fzf'
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0, 0, 0, 0],
  \ 'border': [1]
  \}
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}
" }}}

" Auto testing
" au BufWritePost *.cs call RunTest()
map <space>test :call RunTest()<cr>
function RunTest()
    execute "silent !~/TheDarkDungeons/DarkDungeon.Tests/fulltest.sh > testresult.txt"
    redraw!
endfunction
map <space>res :!bat testresult.txt<cr>

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
map <space>db :call VimspectorAttatch()<CR> 
map <space>dp :OmniSharpDebugProject<cr>

function VimspectorAttatch()
    let g:pid = system("pgrep TheDarkDungeons")
    call vimspector#LaunchWithConfigurations({
                \  "attach": {
                \    "adapter": "netcoredbg",
                \    "configuration": {
                \      "request": "attach",
                \      "processId": g:pid
                \    }
                \  }
                \})
endfunction

" Lightline
let g:lightline = {
\ 'colorscheme': 'rosepine',
\ 'active': {
\   'right': [
\     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
\     ['lineinfo'], ['percent'],
\     ['fileformat', 'fileencoding', 'filetype', 'sharpenup']
\   ]
\ },
\ 'inactive': {
\   'right': [['lineinfo']]
\ },
\ 'component': {
\   'sharpenup': sharpenup#statusline#Build()
\ },
\ 'component_expand': {
\   'linter_checking': 'lightline#ale#checking',
\   'linter_infos': 'lightline#ale#infos',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok'
  \  },
  \ 'component_type': {
  \   'linter_checking': 'right',
  \   'linter_infos': 'right',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'right'
\  },
\ 'component_function': {
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \ },
\}
function! LightlineFileencoding()
  return winwidth(0) > 70 ? &fileencoding : ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" Use unicode chars for ale indicators in the statusline
let g:lightline#ale#indicator_checking = "~"
"let g:lightline#ale#indicator_infos = "\uf129 "
"let g:lightline#ale#indicator_warnings = "\uf071 "
"let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "✓"

" Colorscheme
colorscheme rose-pine-light
"au User IdkAppearanceChanged call IdkmodUpdateLightline() 

"let g:IDarkModeDarkTheme = 'rose-pine-dark'
"let g:IDarkModeLightTheme = 'rose-pine-light'
"let g:IDarkModeLightlineThemePath = 'autoload/lightline/colorscheme/rosepine.vim'
autocmd! FileType fzf set laststatus=0
            \|autocmd BufLeave <buffer> set laststatus=2
au VimEnter * doau User IdkAppearanceChanged
autocmd User IdkAppearanceChanged highlight Pmenu ctermbg=blue
autocmd User IdkAppearanceChanged highlight Search ctermfg=black
autocmd User IdkAppearanceChanged highlight signcolumn ctermbg=black
autocmd User IdkAppearanceChanged highlight visual ctermbg=black
autocmd User IdkAppearanceChanged highlight MatchParen ctermbg=black cterm=bold
autocmd User IdkAppearanceChanged highlight ALEError ctermfg=red ctermbg=lightyellow
autocmd User IdkAppearanceChanged highlight ALEWarning ctermbg=blue
