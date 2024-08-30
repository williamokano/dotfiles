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


vim.keymap.set('n', '<leader>jr', function()
    local current_word = vim.fn.expand('<cWORD>')

    -- Jira URL pattern
    local jira_pattern = 'https://jira%.%w+%.com/browse/(%w+%-%d+)'

    -- Check if the current word matches the Jira pattern
    local jira_id = string.match(current_word, jira_pattern)

    if jira_id then
        -- Create the replacement
        local new_string = string.format('[%s](%s)', jira_id, current_word)

        -- Replace the current word with the new string
        vim.api.nvim_command('normal! ciW' .. new_string)
    end
end)
vim.keymap.set({'v', 'x'}, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '<Esc>"+yy')

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if vim.fn.argc() > 0 then
            local file_dir = vim.fn.fnamemodify(vim.fn.argv(0), ":p:h")
            vim.cmd("lcd" .. file_dir)
            vim.api.nvim_del_autocmd(vim.api.nvim_get_autocmds({ group = "SetInitialCWD" })[1].id)
        end
    end,
    group = vim.api.nvim_create_augroup("SetInitialCWD", { clear = true })
})

