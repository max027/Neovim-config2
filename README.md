# This is new Neovim config 
## package manager used
*   lazynvim

## package used
* Treesitter
* Telescope
* Mason
* gitsigns
* Neovim lsp
* Trouble


# Treesitter

* add following line if your on windows 
```lua
  require 'nvim-treesitter.install'.prefer_git = false
  require 'nvim-treesitter.install'.compilers = { "clang" }
```


