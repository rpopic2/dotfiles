" init for coc

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gD :tabnew<cr><c-o><Plug>(coc-definition)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

inoremap <expr><c-n> coc#pum#visible() ? coc#pum#next(1) : coc#refresh()
inoremap <expr><c-p> coc#pum#visible() ? coc#pum#prev(1) : coc#refresh()
inoremap <expr><c-s-f> coc#pum#visible() ? coc#pum#scroll(1) : coc#refresh()
inoremap <expr><c-s-b> coc#pum#visible() ? coc#pum#scroll(0) : coc#refresh()
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<C-n>"
  nnoremap <silent><nowait><expr> <C-p> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "\<C-p>"
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" coc-fzf
" Mappings for CoCList
" Show all diagnostics.
let g:coc_fzf_preview_fullscreen = 1
nnoremap <silent><nowait> <space>d  :<C-u>CocFzfList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocFzfList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocFzfList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocFzfList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocFzfList -I symbols<cr>
 " Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocFzfListResume<CR>

" Symbol renaming.
nmap <space>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <space>f  <Plug>(coc-format-selected)
nmap <space>f  <Plug>(coc-format-selected)
aug rustfmt
    au!
    au BufEnter *.rs map <space>f :RustFmt<cr>
aug end

" Applying codeAction to the selected region.
" Example: `<space>aap` for current paragraph
xmap <silent> <space>a  <Plug>(coc-codeaction-selected)
nmap <silent> <space>a  <Plug>(coc-codeaction-selected)


" Remap keys for applying codeAction to the current buffer.
nmap <silent> <space>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <space>qf  <Plug>(coc-fix-current)

" Remap keys for refactor code actions.
nmap <silent> <space>re <Plug>(coc-codeaction-refactor)
xmap <silent> <space>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <space>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line.
nmap <space>cl  <Plug>(coc-codelens-action)

