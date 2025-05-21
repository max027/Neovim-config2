# This is new Neovim config 
## package manager used
*   lazynvim

## package used
* Treesitter
* Telescope
* Mason
* Neovim lsp
* barbar
* vim navigator
* Trouble
* nvim-web-devicons

# Installation
clone the repo
```bash
git clone https://github.com/max027/Neovim-config2.git
```
copy content of folder in the related folder

In windows
```cmd
copy-item -path path\to\neovim-config2 -destination path\to\appdata\nvim -recurse -force
```
In linux
```bash
cp -r Neovim-config2/{.,}* ~/.config/nvim/
```

# Workspace
* All plugins are stored in lua/plugins and lua/config contain init.lua for lazy.nvim
* Lazy nvim will search plugins folder 
* All keymap are in lua/keymaps.lua to change edit 

# Theme
Default theme of editor is tokyonight

# Treesitter

add following line if your on windows in treesitter.lua file in lua/plugins
```lua
  require 'nvim-treesitter.install'.prefer_git = false
  require 'nvim-treesitter.install'.compilers = { "clang" }
```
Treesitter does note install parsers automatically to change edit treesitter.lua

## note for windows
Install clang and llvm ,mingw does note work.Also need visual studio or else parser wont compile


# Lsp
By-default lsp is configured for lua,rust,typescript.To change edit lua/plugins/nvim-lspconfig

# Mason 
mason handel Installation of lsp servers.To install use 
```bash
:Mason
```
go to desired server and press i

# Vim navigator
use to navigate between different panes in tmux when neovim is opened

