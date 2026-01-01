return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    configs.setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },

      autotag = {
        enable = true,
      },

      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "json",
        "yaml",
        "toml",
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "python",
        "go",
        "rust",
      },

      auto_install = true,
      sync_install = false,
    })
  end,
}
