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

- Nerdfonts

```
https://www.nerdfonts.com/
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

# Ident

This plugin is used for displaying thin vertical lines at each indentation level for code indented with spaces. For code indented with tabs I think there is no need to support it, because you can use :set list lcs=tab:\|\ (here is a space).

```
Plug 'Yggdroot/indentLine'

```

[Read more](#https://github.com/Yggdroot/indentLine)

# File manager

The NERDTree is a file system explorer for the Vim editor. Using this plugin, users can visually browse complex directory hierarchies, quickly open files for reading or editing, and perform basic file system operations.

```
Plug 'scrooloose/nerdtree'

```

[Read more](https://github.com/preservim/nerdtree)

# Commentary

Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion (for example, gcap to comment out a paragraph), gc in visual mode to comment out the selection, and gc in operator pending mode to target a comment. You can also use it as a command, either with a range like :7,17Commentary, or as part of a :global invocation like with :g/TODO/Commentary. That's it.

I wrote this because 5 years after Vim added support for mapping an operator, I still couldn't find a commenting plugin that leveraged that feature (I overlooked tcomment.vim). Striving for minimalism, it weighs in at under 100 lines of code.

Oh, and it uncomments, too. The above maps actually toggle, and gcgc uncomments a set of adjacent commented lines.

```
Plug 'tpope/vim-commentary'

```

[Read more](#https://github.com/tpope/vim-commentary)

# Auto Pairs

Insert or delete brackets, parens, quotes in pair.

```
Plug 'jiangmiao/auto-pairs'
```

[Read more](https://github.com/jiangmiao/auto-pairs)

# Surrond

Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.

```
Plug 'tpope/vim-surround'
```

[Read more](https://github.com/tpope/vim-surround)

# Telescope

telescope.nvim is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core. Telescope is centered around modularity, allowing for easy customization.

```
Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1'}
Plug 'nvim-treesitter/nvim-treesitter',{'do': ':TSUpdate'}
Plug 'David-Kunz/markid'
```

[Read more](https://github.com/nvim-telescope/telescope.nvim)

# Git

## vim signify

Signify (or just Sy) uses the sign column to indicate added, modified and removed lines in a file that is managed by a version control system (VCS).

```
Plug 'mhinz/vim-signify'
```

[Read more](https://github.com/mhinz/vim-signify)

## git signs

Super fast git decorations implemented purely in lua/teal.

```
Plug 'lewis6991/gitsigns.nvim'
```

[Read more](https://github.com/lewis6991/gitsigns.nvim)

## fugitive

fugitive.vim: A Git wrapper so awesome, it should be illegal
`   Plug 'tpope/vim-fugitive'
  `

[Read more](https://github.com/doronbehar/nvim-fugitive)

# Debugger

## vimspector

vimspector - A multi-language debugging system for Vim
`Plug 'puremourning/vimspector'`

[Read more](https://github.com/puremourning/vimspector)

# issues

kite has conflict with others autocompletion tools.
