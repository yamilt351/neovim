
:set mouse=a
:syntax enable
:set showcmd
:set encoding=utf-8
:set showmatch
:set relativenumber
:set sw=2
:set cursorline
:set splitbelow
:set splitright
:set autoindent
:set tabstop=4
:set smarttab
:set softtabstop=4
:set completeopt=menuone,noselect
:set omnifunc=syntaxcomplete#Complete
:set shiftwidth=4
:set hlsearch
:set spell
:set clipboard=unnamedplus
:set cc=80
:set ttyfast
:set statusline
:set laststatus=2
:set incsearch
:set smartcase
:set wrap
:set visualbell
:set confirm


call plug#begin('~/.vim/plugged')

"tema
Plug 'sainnhe/gruvbox-material'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

"lsp
Plug 'neoclide/coc.nvim',{'release':'master','do':'yarn install --frozen-lockfile'}
"instalador de plugins 
Plug 'junegunn/vim-plug'

"autocompletado  requiere sudo npm install -g typescript typescript-language-server
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim',{'branch':'release'}

"snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"error lens
Plug 'folke/trouble.nvim'

"iconos de errores
Plug 'kyazdani42/nvim-web-devicons'

"autocompletado en base a texto 
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc-eslint'

"indent 
Plug 'Yggdroot/indentLine'

"barra de status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"showFiles
Plug 'scrooloose/nerdtree'

"Commentary 
Plug 'tpope/vim-commentary'

"auto pairs
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" telescope
Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1'}
Plug 'nvim-treesitter/nvim-treesitter',{'do': ':TSUpdate'} 
Plug 'David-Kunz/markid'
"diferencias entre archivos 
Plug 'mhinz/vim-signify'

" git integrations 
"Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" debugger
Plug 'puremourning/vimspector'
call plug#end()


"//////////////////////////////////////////////////////////////////////////////
"/////////////////////////////////////////////////////////////////////////////
" Themes 
set background:dark
let g:lightline = {'colorscheme': 'tokyonight'}
"let g:gruvbox_material_background='medium'
"colorscheme tokyonight-night
colorscheme tokyonight-storm
"colorscheme tokyonight-day
"colorscheme tokyonight-moon
"colorscheme gruvbox-material


"//////////////////////////////////////////////////////////////////////////////

"Snippets
let g:UltiSnipsExpandTrigger="<C-l>"


##############################################################################


" configuracion de airline
" ////////////////////////////////////////////////////////////////////////////
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:tmuxline_powerline_separators = 0
let g:airline_theme='tomorrow'


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
"///////////////////////////////////////////////////////////////////////////




############################################################################## 
"autotag
let g:closetag_xhtml_filenames='*.xhtml,*.jsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
############################################################################## 
 

##############################################################################
############################################################################## 

lua << EOF
require("trouble").setup{}

require"lspconfig".tsserver.setup{}

require('gitsigns').setup()
require'nvim-treesitter.configs'.setup {
  markid = { enable = true }
}
EOF

##############################################################################
##############################################################################

########################################################################################
#################### --- CONFIGURACION DE LOS ATAJOS -- ################################
######################################################################################## 


"----------------------------------------------------------
" configuracion de comentarios
nnoremap <space>, :Commentary<CR>
vnoremap <space>, :Commentary<CR>  
"---------------------------------------------------------

"---------------------------------------------------------
"configuracion de format
":CocInstall coc-html coc-tsserver coc-json coc-emmet coc-prettier
nnoremap <space>f :call CocAction('format')<CR>
"-----------------------------------------------------------

"-----------------------------------------------------------
"Configuracion de tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
"----------------------------------------------------------


"---------------------------------------------------------
"configuracion de el debugger

let g:vimspector_base_dir='/home/yamil/.vim/plugged/vimspector'
nnoremap <c-a> :call vimspector#Launch()<CR>
nnoremap <c-q> :call vimspector#Reset()<CR>
nnoremap <c-w> :call vimspector#Continue()<CR>

nnoremap <c-e> :call vimspector#ToggleBreakpoint()<CR>
nnoremap <c-r> :call vimspector#ClearBreakpointis()<CR>

nmap <TAB>3 <Plug>VimspectorRestart
nmap <TAB>2 <Plug>VimspectorStepOut
nmap <TAB>1 <Plug>VimspectorStepInto
nmap <TAB>4 <Plug>VimspectorStepOver
"--------------------------------------------------------

"-----------------------------------------------------------
" NERDTREE Configuracion
" let NERDTreeQuitOnOpen =1 
let NERDTreeQuitOnOpen=0
nnoremap  <f2> :NERDTreeToggle<CR>
"----------------------------------------------------------

"------------------------------------------------------------
" Terminal configuracion
vnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>
nnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>
"---------------------------------------------------------------

"Telescope configuracion 
nnoremap <space>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <space>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <space>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <space>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <space>1 :Telescope buffers<CR>
"_________________________________________________________________________________


######################################################################################## 
######################################################################################## 
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
