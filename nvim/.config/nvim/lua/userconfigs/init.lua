vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- line number config
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = " "
vim.keymap.set('i', 'jj', '<Esc>')

vim.keymap.set('n', '<leader>ci', function()
    local key = vim.fn.nr2char(vim.fn.getchar())
    local command = "T" .. key .. "dt" .. key .. "i"
    local feedkeysstr = vim.api.nvim_replace_termcodes(command, true, true, true)
    vim.api.nvim_feedkeys(feedkeysstr, 'n', true)

    return ""
end)

vim.keymap.set({'i', 'v', 'x'}, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '<Esc>"+yy')
