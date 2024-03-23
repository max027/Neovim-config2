return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")
    local luasnip = require('luasnip')
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
          --luasnip.parser.parse_snippet(args.body)
        end,
      },
      completion = {
        autocompletion=false,
        completeopt = 'menu,menuone,noinsert'
      },
      --preselect = cmp.PreselectMode.None,

      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "luasnip",priority = 90}, -- snippets
        { name = "nvim_lsp",priority = 80 }, -- lsp
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like icons
      formatting = {
        format =function (entry,item)
          local menu_icon = {
            luasnip  = "LSNP",
            nvim_lsp = "NLSP",
            nvim_lua = "NLUA",
            buffer   = "BUFF",
            path     = "PATH",
            rust_analyzer="Rust",
          }

          item.menu = menu_icon[entry.source.name]
          local  fixed_width = 35

          -- Set 'fixed_width' to false if not provided.
          fixed_width = fixed_width or false


          -- Get the completion entry text shown in the completion window.
          local content=item.abbr

          -- Set the fixed completion window width.
          if fixed_width then
            vim.o.pumwidth = fixed_width
          end

          -- Get the width of the current window.
          local win_width = vim.api.nvim_win_get_width(0)


          -- Set the max content width based on either: 'fixed_width'
          -- or a percentage of the window width, in this case 20%.
          -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
          local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)


          --Truncate the completion entry text if it's longer than the
          -- max content width. We subtract 3 from the max content width
          -- to account for the "..." that will be appended to it.
          if #content > max_content_width then
            item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
          else
            item.abbr = content .. (" "):rep(max_content_width - #content)
          end
          return item

        end,
      },
    })

  end,
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
    },
  },
}
