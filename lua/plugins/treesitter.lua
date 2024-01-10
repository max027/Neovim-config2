local config=function()
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
