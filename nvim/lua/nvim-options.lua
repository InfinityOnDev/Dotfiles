vim.cmd("set expandtab")
vim.cmd("set tabstop=2")

vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.breakindent = true

vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.showmode = false

-- highlighting line number the cursor is at 
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.signcolumn = "yes" --the extra space on the left of line no.

--for transparent background in Neovim
vim.cmd.highlight({ "Normal", "guibg=NONE" })
vim.cmd.highlight({ "Normal", "ctermbg=NONE" })
vim.o.termguicolors = true --24 bit colors

--incremental search 
vim.o.incsearch = true

-- for pane navigation 
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- no swapfiles 
vim.opt.swapfile = false

-- set encoding 
vim.opt.encoding = "UTF-8"

-- move lines up/down 
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", {desc="Move line up"})
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", {desc="Move line down"})
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", {desc="Move selection up"})
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", {desc="Move selection down"})

