-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[colorscheme onedark]]

-- Set statusbar
vim.g.lightline = {
    colorscheme = "onedark",
    active = {
        left = { { "mode", "paste" }, { "gitbranch", "readonly", "filename", "modified" } },
    },
    component_function = {
        gitbranch = "fugitive#head",
    },
}

-- Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {
    noremap = true,
    silent = true,
})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Remember last position
vim.cmd [[
  augroup LastPosition
    autocmd!
    autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  augroup end
]]

-- Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
