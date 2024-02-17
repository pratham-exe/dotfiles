local opts = { noremap = true, silent = true }
local autocmd = vim.api.nvim_create_autocmd

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)

-- Neotree 
keymap("n","<leader>e",":Neotree toggle<cr>",opts)

-- Bufferline 
keymap("n","<leader>d",":bdelete<cr>",opts)

-- oil.nvim 
keymap("n","<leader>o",":Oil<cr>",opts)

-- autocompile
autocmd("FileType", { pattern = "python",
	callback = function()
		vim.api.nvim_buf_set_keymap(0,"n","<C-c>",":vsplit<CR>:te python3 '%'<CR>i",opts)
	end})
autocmd("FileType", { pattern = "cpp",
	callback = function()
		vim.api.nvim_buf_set_keymap(0,"n","<C-c>",":vsplit<CR>:te g++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -D_GLIBCXX_DEBUG && ./%:t:r<CR>i",opts)
	end})
autocmd("FileType", { pattern = "c",
	callback = function()
		vim.api.nvim_buf_set_keymap(0,"n","<C-c>",":vsplit<CR>:te gcc -Wshadow -Wall % -g -D_GLIBCXX_DEBUG && ./a.out<CR>i",opts)
	end})
autocmd("FileType", { pattern = "rust",
	callback = function()
		vim.api.nvim_buf_set_keymap(0,"n","<C-c>",":vsplit<CR>:te rustc % -g && ./%:t:r<CR>i",opts)
	end})
