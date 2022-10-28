local options = {
    -- Global scope
    incsearch = true,
    smartcase = true, -- smart case
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    backup = false, -- creates a backup file
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    hlsearch = true, -- highlight all matches on previous search pattern
    termguicolors = true, -- set term gui colors (most terminals support this)
    background = "light",
    -- background = "dark",
    cmdheight = 2, -- more space in the neovim command line for displaying messages
    updatetime = 300, -- faster completion (4000ms default)
    mouse = "a", -- allow the mouse to be used in neovim
    completeopt = { "menuone", "noselect", "noinsert" }, -- mostly just for cmp
    hls = false, -- turn off highlight

    -- Buffer scope
    tabstop = 4, -- insert 4 spaces for a tab
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    expandtab = true, -- convert tabs to spaces
    softtabstop = 4,
    smartindent = true, -- make indenting smarter again

    -- Window scope
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    wrap = false, -- display lines as one long line
    cursorline = true, -- highlight the current line
    colorcolumn = "80", -- highlight the 80th column
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time

    -- Other things
    fileencoding = "utf-8", -- the encoding written to a file
    showtabline = 0, -- always show tabs

    ignorecase = true, -- ignore case in search patterns
    scrolloff = 5, -- number of lines before the end of the screen to start scrolling the text
    sidescrolloff = 5,

}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Disables automatic commenting on newline:
vim.cmd [[set formatoptions-=cro]]

-- Automatically deletes all trailing whitespace and newlines at end of file on save.
vim.api.nvim_command [[ autocmd BufWritePre * %s/\s\+$//e ]]
vim.api.nvim_command [[ autocmd BufWritePre * %s/\n\+\%$//e ]]

-- vim.api.nvim_command [[ autocmd BufWritePre *.py :lua vim.lsp.buf.formatting_sync() ]]

-- disable diagnostic as virtual text
vim.diagnostic.config({
    virtual_text=false
})

-- show diagnostic on hold
vim.cmd [[ autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false}) ]]

-- vim.api.nvim_command[[ autocmd BufWritePre * :lua vim.lsp.buf.formatting_sync() ]]
-- vim.api.nvim_command[[ let g:afterglow_blackout=1 ]]
