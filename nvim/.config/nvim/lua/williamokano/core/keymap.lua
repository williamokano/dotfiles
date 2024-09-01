vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jj", "<ESC>", { desc = "Escape from insert mode using jj" })

-- clear highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- My custom keymaps
-- Insert new line ignoring everything else (ctrl + enter in VSCODE)
vim.keymap.set("i", "<S-CR>", "<C-o>o", { noremap = true, silent = true })

-- change inner until character on both sides
vim.keymap.set("n", "<leader>ci", function()
  local key = vim.fn.nr2char(vim.fn.getchar())
  local command = "T" .. key .. "dt" .. key .. "i"
  local feedkeysstr = vim.api.nvim_replace_termcodes(command, true, true, true)
  vim.api.nvim_feedkeys(feedkeysstr, "n", true)

  return ""
end)

-- Jira URL to markdown replacer
vim.keymap.set("n", "<leader>jr", function()
  local current_word = vim.fn.expand("<cWORD>")

  -- Jira URL pattern
  local jira_pattern = "https://jira%.%w+%.com/browse/(%w+%-%d+)"

  -- Check if the current word matches the Jira pattern
  local jira_id = string.match(current_word, jira_pattern)

  if jira_id then
    -- Create the replacement
    local new_string = string.format("[%s](%s)", jira_id, current_word)

    -- Replace the current word with the new string
    vim.api.nvim_command("normal! ciW" .. new_string)
  end
end)
