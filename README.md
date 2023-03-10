# NEOVIM init.vim
```
:set mouse=a
:syntax enable
:set showcmd
:set encoding=utf-8
:set showmatch
:set number
:set sw=2
:set cursorline
:set splitbelow
:set splitright
:set autoindent
:set tabstop=2
:set smarttab
:set softtabstop=4
:set pumheight=10
:set completeopt=menuone,noselect
:set omnifunc=syntaxcomplete#Complete
:set shiftwidth=4
:set hlsearch
:set spell
:set clipboard+=unnamedplus
:set cc=80
:set ttyfast
filetype plugin indent on
:set laststatus=2
:set incsearch
:set smartcase
:set wrap
:set visualbell
:set confirm
:set foldmethod=indent
:set noruler
```

```
call plug#begin('~/.vim/plugged')

"tema
Plug 'sainnhe/gruvbox-material'
" search and replace
Plug 's1n7ax/nvim-search-and-replace'
"lsp
Plug 'neoclide/coc.nvim',{'release':'master','do':'yarn install --frozen-lockfile'}
"instalador de plugins 
Plug 'junegunn/vim-plug'
"autocompletado  requiere sudo npm install -g typescript typescript-language-server
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim',{'branch':'release'}
"error lens
Plug 'folke/trouble.nvim'
"iconos de errores
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
"color linea de indentacion 
Plug 'Yggdroot/indentLine'
"autocompletado en base a texto 
Plug 'neoclide/coc-eslint'
"autopairs
Plug 'windwp/nvim-autopairs'
" highlight 
Plug 'pangloss/vim-javascript'
"barra de status
Plug 'vim-airline/vim-airline'
"Commentary 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
"diferencias entre archivos 
Plug 'mhinz/vim-signify'
" git integrations 
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
"buffer naveigation
Plug 'johann2357/nvim-smartbufs'
call plug#end()
```


```
" NERDTreeToggle
let NERDTreeShowHidden=1

" Themes 
set background:dark
let g:gruvbox_material_background='hard'
colorscheme gruvbox-material

"indentLine config
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0


"configuracion de airline ////////////////////////////////////////////////
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:tmuxline_powerline_separators = 0


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'



let g:javascript_plugin_jsdoc = 1
set conceallevel=1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
```
"///////////////////////////////////////////////////////////////////////////


```
lua << EOF
require("trouble").setup{}

require"lspconfig".tsserver.setup{}

require('gitsigns').setup()

require("nvim-autopairs").setup {}

require('nvim-search-and-replace').setup{
    -- file patters to ignore
    ignore = {'**/node_modules/**', '**/.git/**',  '**/.gitignore', '**/.gitmodules','build/**'},

    -- save the changes after replace
    update_changes = false,

    -- keymap for search and replace
    replace_keymap = '<space>gr',

    -- keymap for search and replace ( this does not care about ignored files )
    replace_all_keymap = '<space>gR',

    -- keymap for search and replace
    replace_and_save_keymap = '<space>gu',

    -- keymap for search and replace ( this does not care about ignored files )
    replace_all_and_save_keymap = '<spacer>gU',
}

EOF
```
```
" configuracion de comentarios
nnoremap <space>, :Commentary<CR>
vnoremap <space>, :Commentary<CR>  

"configuracion de format
":CocInstall coc-html coc-tsserver coc-json coc-emmet coc-prettier
nnoremap <space>f :call CocAction('format')<CR>:w<CR>

" buffer
nnoremap <space>1 :lua require("nvim-smartbufs").goto_buffer(1)<CR>
nnoremap <space>2 :lua require("nvim-smartbufs").goto_buffer(2)<CR>
nnoremap <space>3 :lua require("nvim-smartbufs").goto_buffer(3)<CR>
nnoremap <space>4 :lua require("nvim-smartbufs").goto_buffer(4)<CR>
nnoremap <space>5 :lua require("nvim-smartbufs").goto_buffer(5)<CR>
nnoremap <space>6 :lua require("nvim-smartbufs").goto_buffer(6)<CR>
nnoremap <space>7 :lua require("nvim-smartbufs").goto_buffer(7)<CR>
nnoremap <space>8 :lua require("nvim-smartbufs").goto_buffer(8)<CR>
nnoremap <space>9 :lua require("nvim-smartbufs").goto_buffer(9)<CR>
" Delete the N buffer according to :ls buffer list
nnoremap <space>q1 :lua require("nvim-smartbufs").close_buffer(1)<CR>
nnoremap <space>q2 :lua require("nvim-smartbufs").close_buffer(2)<CR>
nnoremap <space>q3 :lua require("nvim-smartbufs").close_buffer(3)<CR>
nnoremap <space>q4 :lua require("nvim-smartbufs").close_buffer(4)<CR>
nnoremap <space>q5 :lua require("nvim-smartbufs").close_buffer(5)<CR>
nnoremap <space>q6 :lua require("nvim-smartbufs").close_buffer(6)<CR>
nnoremap <space>q7 :lua require("nvim-smartbufs").close_buffer(7)<CR>
nnoremap <space>q8 :lua require("nvim-smartbufs").close_buffer(8)<CR>
nnoremap <space>q9 :lua require("nvim-smartbufs").close_buffer(9)<CR>

nnoremap <space>qq :w<CR>:bd<CR>:bnext<CR>
nnoremap <space>nn :bnext<CR>
nnoremap <space>NN :bprev<CR>

" DEBUGGER CONFIG 
nnoremap <space>x <CR>
nnoremap <space>X <CR>
nnoremap <space>xi <CR>
nnoremap <space>xr <CR>


"TREE Configuracion
nnoremap <F2> :NERDTreeToggle<CR>
vnoremap <F2> :NERDTreeToggle<CR>

"MERGE CONFLICT FILES 
nnoremap <space>m :DiffviewOpen<CR>

" Terminal configuracion
nnoremap <space>gg :vertical Git<CR>:split<CR>:ter<CR>
nnoremap <space>v :vsplit<CR>
```

```
"COC configuracion

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
endif
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
endif 
" Use `[[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
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

" Add (Neo)Vim's native statusline support.
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
```
# CocConfig
```
{
  "suggest.noselect": true,
  "suggest.enablePreselect": false,
  "suggest.autoTrigger": "always",
  "suggest.timeout": 5000,
  "suggest.detailField": "preview",
  "codeLens.enable": true,
  "eslint.format.enable": true,
  "eslint.enable": true,
  "eslint.packageManager": "npm",
  "eslint.fixOnSaveTimeout": 1000,
  "eslint.alwaysShowStatus": true,
  "eslint.run": "onType",
  "javascript.suggest.enabled": true,
  "javascript.suggest.autoImports": true,
  "diagnostic.messageTarget": "float",
  "diagnostic.checkCurrentLine": true,
  "javascript.format.insertSpaceAfterSemicolonInForStatements": true,
  "diagnostic.warningSign": "⚠",
  "diagnostic.virtualTextFormat": "%message",
  "colors.enable": true,
  "highlight.colors.enable": true,
  "css.format.enable": true,
  "javascript.format.enable": true,
  "javascript.autoClosingTags": true,
  "javascript.preferences.quoteStyle": "single",
  "highlight.colorNames.enable": true,
  "snippet.highlight": true,
  "colors.highlightPriority": 1000,
  "highlight.trace": "messages",
  "diagnostic.enableHighlightLineNumber": true,
  "coc.preferences.formatOnType": true
}
```
