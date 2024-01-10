-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

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
keymap('n','<A-e>',':Explore<CR>',opts)

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

--search
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
    keymap('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    keymap('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    keymap('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    keymap('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    keymap('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    keymap('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    keymap('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    keymap('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    keymap('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

    -- Text object
    keymap('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    keymap('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
