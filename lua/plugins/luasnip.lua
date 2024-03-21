local config=function()
  local ls = require("luasnip")
  local types = require("luasnip.util.types")
  local s = ls.snippet
  local sn = ls.snippet_node
  local isn = ls.indent_snippet_node
  local t = ls.text_node
  local i = ls.insert_node
  local f = ls.function_node
  local c = ls.choice_node
  local d = ls.dynamic_node
  local r = ls.restore_node
  local events = require("luasnip.util.events")
  local ai = require("luasnip.nodes.absolute_indexer")
  local extras = require("luasnip.extras")
  local l = extras.lambda
  local rep = extras.rep
  local p = extras.partial
  local m = extras.match
  local n = extras.nonempty
  local dl = extras.dynamic_lambda
  local fmt = require("luasnip.extras.fmt").fmt
  local fmta = require("luasnip.extras.fmt").fmta
  local conds = require("luasnip.extras.expand_conditions")
  local postfix = require("luasnip.extras.postfix").postfix
  local parse = require("luasnip.util.parser").parse_snippet
  local ms = ls.multi_snippet
  local k = require("luasnip.nodes.key_indexer").new_key

  require("luasnip.loaders.from_vscode").lazy_load()
  vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
  vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
  vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

  vim.keymap.set({"i", "s"}, "<C-E>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, {silent = false})

  ls.config.set_config({
    history = true,
      region_check_events = 'InsertEnter',
      delete_check_events = 'InsertLeave',
    -- Update more often, :h events for more info.
    updateevents = "TextChanged,TextChangedI",
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "choiceNode", "Comment" } },
        },
      },
    },
    -- treesitter-hl has 100, use something higher (default is 200).
    ext_base_prio = 300,
    -- minimal increase in priority.
    ext_prio_increase = 1,
    enable_autosnippets = true,
  })
  ls.add_snippets("typescript",{
    s("logg",fmt("console.log('{}')",{
      i(1)
    })),
    s("jfl",fmt([[
    for(let {}=0;{}<{};{}++){{
      {}
    }}]],{
      i(1),rep(1),i(2),rep(1),i(3)
    })),
    s("jaf",fmt([[
    const {}=({})=>{{
      {}
    }}
    ]],{
      i(1),i(2),i(3)
    })),
    s("jff",fmt([[
    function {}({}){{
      {}
    }}
    ]],{
      i(1),i(2),i(3)
    })),
    s("jwl",fmt([[
    while({}){{
      {}
    }}
    ]],{
      i(1),i(2)
    }))
  })
  ls.add_snippets("javascript",{
    s("logg",fmt("console.log('{}')",{
      i(1)
    })),
    s("jwl",fmt([[
    while({}){{
      {}
    }}
    ]],{
      i(1),i(2)
    })),
    s("jfl",fmt([[
    for(let {}=0;{}<{};{}++){{
      {}
    }}]],{
      i(1),rep(1),i(2),rep(1),i(3)
    })),
    s("jaf",fmt([[
    const {}=({})=>{{
      {}
    }}
    ]],{
      i(1),i(2),i(3)
    })),
    s("jff",fmt([[
    function {}({}){{
      {}
    }}
    ]],{
      i(1),i(2),i(3)
    })),
    s("jwl",fmt([[
    while({}){{
      {}
    }}
    ]],{
      i(1),i(2)
    }))
  })

  ls.add_snippets("all", {
    s("tery", {
      i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
    }),

  })
end
return {
  "L3MON4D3/LuaSnip",
  config=config,
  lazy=false,
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
}
