return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    local opts = {
      options = {
        -- mode = "tabs",
        separator_style = "slant",
      },
    }

    require("bufferline").setup(opts)

    vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Cycle to the next tab" })
    vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Cycle to the prev tab" })
    vim.keymap.set("n", "<leader>bw", "<Cmd>bdelete<CR>", { desc = "Close current tab" })
  end,
}
