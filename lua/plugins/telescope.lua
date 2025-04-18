local config=function()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
      file_ignore_patterns = {
        "node_modules",
        ".git",
        "target",
      },
    },
  })
end


return {
  'nvim-telescope/telescope.nvim', 
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy=false,
  config=config,
}
