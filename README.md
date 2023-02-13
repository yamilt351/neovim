# neovim

this is my personal neovim configuration.

#INDEX

- [Setters](#setters)
- [Themes](#themes)
  - [Gruvbox](#gruvbox)
  - [tokyonight](#tokyonight)
- [LSP](#lsp)
- [Autocompletion](#autocompletion)
  - [kiteco](#kiteco)
  - [vim-lspconfig](#vim-lspconfig)
  - [coc.nvim](#coc-nvim)
- [Snipets](#snipets)
  - [Sirver](#sirver)
  - [honza](#honza)
- [Error Lens](#error-lens)
- [Web Icons](#web-icons)
- [Autocompletion Text based](autocompletion-text-based)
  - [Pangloss](#pangloss)
- [Eslint](#eslint)
- [Status bar](#status-bar)
- [File manager](#file-manager)
- [Commentary](#commentary)
- [Icons folder](#icons-folder)
  - [vim-devicons](#vim-devicons)
- [Auto Pairs](#auto-pairs)
- [Surrond](#surrond)
- [Telescope](#telescope)
  - [ripgrep](#ripgrep)
  - [plenary](#plenary)
  - [treesitter](#tressiter)
  - [markid](#markid)
- [Git](#git)
  - [vim signify](#vim-signify)
  - [git signs](#git-signs)
  - [fugitive](#fugitive)
- [Debugger](#debugger)
  - [vimspector](#vimspector)
- [issues](#issues)
- [Others](#others)

# How to use it?

```
git clone https://github.com/yamilt351/neovim.git
```

## Dependencies

- Git

```
sudo apt update && sudo apt install git
```

- Node

```
sudo apt update && sudo apt install node
```

- Vim Plug

```
Plug "junegunn/vim-plug"
```

- Autocompletion

```
sudo npm install -g typescript typescript-language-server
```

- Formatter

```
:CocInstall coc-html coc-tsserver coc-json coc-emmet coc-prettier
```

# Setters

```
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
:set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
:set laststatus=2
:set incsearch
:set smartcase
:set wrap
:set visualbell
:set confirm
:set background:dark


```

# Themes

## Gruvbox

Gruvbox Material is a modified version of Gruvbox, the contrast is adjusted to be softer in order to protect developers' eyes.

```
let g:gruvbox_material_background='medium'
colorscheme gruvbox-material

```

```
Plug 'sainnhe/gruvbox-material'

```

[here](https://neovimcraft.com/plugin/sainnhe/gruvbox-material/index.html)

## tokyonight

A dark and light Neovim theme written in Lua ported from the Visual Studio Code TokyoNight theme. Includes extra themes for Kitty, Alacritty, iTerm and Fish.

```
let g:lightline = {'colorscheme': 'tokyonight'}
colorscheme tokyonight-night
colorscheme tokyonight-storm
colorscheme tokyonight-day
colorscheme tokyonight-moon

```

```
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

```

[here](https://github.com/folke/tokyonight.nvim)

# LSP

Nvim supports the Language Server Protocol (LSP), which means it acts as
a client to LSP servers and includes a Lua framework vim.lsp for building
enhanced LSP tools.
`https://microsoft.github.io/language-server-protocol/`
LSP facilitates features like go-to-definition, find-references, hover,
completion, rename, format, refactor, etc., using semantic whole-project
analysis (unlike ctags).
[Read more](https://neovim.io/doc/user/lsp.html)

```
Plug 'neoclide/coc.nvim',{'release':'master','do':'yarn install --frozen-lockfile'}

```

# Autocompletion

## kiteco

Kite is an AI-powered programming assistant that helps you write Python code inside Vim. Kite helps you write code faster by showing you the right information at the right time. Learn more about how Kite helps you while you're using Vim at https://kite.com/integrations/vim/.

[Read more](https://github.com/kiteco/vim-plugin)

```
:set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
```

if you wanna use kite you have to use this configuration to activate the prompt

```
Plug 'kiteco/vim-plugin'

```

[issues](#issues)

## vim-lspconfig

provides autocompletion

```
Plug 'neovim/nvim-lspconfig'

```

[Read more](https://github.com/neovim/nvim-lspconfig)

## coc.vim

autocompletion tool

```
Plug 'neoclide/coc.nvim',{'branch':'release'}


```

[Read more](https://github.com/neoclide/coc.nvim)

#Snipets

## sirver

UltiSnips is the ultimate solution for snippets in Vim. It has many features, speed being one of them.

```
Plug 'SirVer/ultisnips'

```

[Read more](https://github.com/SirVer/ultisnips)

## honza

This repository contains snippets files for various programming languages.

It is community-maintained and many people have contributed snippet files and other improvements already.

```
Plug 'honza/vim-snippets'

```

[Read more](https://github.com/honza/vim-snippets)

# Error Lens

A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.

```
Plug 'folke/trouble.nvim'

```

[Read more](https://github.com/folke/trouble.nvim)

# Web Icons

A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.

```
Plug 'kyazdani42/nvim-web-devicons'

```

[Read more](https://neovimcraft.com/plugin/kyazdani42/nvim-web-devicons/index.html)

# Autocompletion Text based

## Pangloss

JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.

```
 Plug 'pangloss/vim-javascript'

```

[issues](issues)
[Read more](https://github.com/pangloss/vim-javascript)

# Eslint

Eslint language server extension for coc.nvim.

Forked from vscode-eslint.

Note buffers need save to disk to make this extension work as expected.

    ```
    Plug 'neoclide/coc-eslint'
    ```

[Read more](https://github.com/neoclide/coc-eslint)

# Status bar

Lean & mean status/tabline for vim that's light as air

[Read more](https://github.com/vim-airline/vim-airline)

```
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
```

