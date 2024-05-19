local config=function()
  --for windows else treesitter parser wont compile
  --require 'nvim-treesitter.install'.prefer_git = false
  --require 'nvim-treesitter.install'.compilers = { "clang" }


  require("nvim-treesitter.configs").setup({

    build = ":TSUpdate",
    auto_install = false,
    autotag = {
      enable = true,
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  })
end


return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = config,
}
