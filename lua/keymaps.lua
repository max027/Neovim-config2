-- Shorten function name
local keymap =vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Better window navigation
--[[
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
]]--
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--past to system reg
keymap("n","<leader>y","\"+y")
keymap("v","<leader>y","\"+y")
keymap("n","<leader>y","\"+Y")


--Move up or Down
keymap("v","J",":m '>+1<CR>gv=gv")
keymap("v","K",":m '<-2<CR>gv=gv")


-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n","<S-c>",":bdelete<CR>",opts)


-- Re-order to previous/next
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Magic buffer-picking mode
keymap('n', '<C-p>',   '<Cmd>BufferPick<CR>', opts)
keymap('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

--ctrl-s to save
keymap('n','<C-s>',':w<CR>',opts)

--shortcut for explorer
keymap('n','<A-q>',':Explore<CR>',opts)

--Shourtcut for end of line
-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

--lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)


--close file
keymap("n","<C-q>",":q<CR>",opts)

--replace
keymap("n","<leader>e",":%s/",opts)


--git
 -- Navigation
    keymap('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    keymap('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    keymap('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    keymap('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    keymap('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    keymap('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    keymap('n', '<leader>ha', '<cmd>Gitsigns stage_buffer<CR>')
    keymap('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    keymap('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    keymap('n', '<leader>hq', '<cmd>Gitsigns preview_hunk<CR>')
    keymap('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    keymap('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    keymap('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    keymap('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    keymap('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

    -- Text object
    keymap('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    keymap('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
--[[
--Trouble
--keymap("n", "<leader>xx", function() require("trouble").toggle() end)
--keymap("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
--keymap("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
--keymap("n", "gR", function() require("trouble").toggle("lsp_references") end)
--]]

