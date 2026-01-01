return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local function has(cmd)
      return vim.fn.executable(cmd) == 1
    end

    local function extend(dst, src)
      for _, v in ipairs(src) do
        table.insert(dst, v)
      end
    end

    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- ======================
    -- LSP servers
    -- ======================
    local lsp_servers = {
      "lua_ls",
      "terraformls",
    }

    if has("node") then
      extend(lsp_servers, {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "bashls",
        "pyright",
        "graphql",
        "emmet_ls",
      })
    end

    if has("go") then
      extend(lsp_servers, { "gopls" })
    end

    if has("rustc") then
      extend(lsp_servers, { "rust_analyzer" })
    end

    mason_lspconfig.setup({
      ensure_installed = lsp_servers,
      automatic_installation = true,
    })

    -- ======================
    -- Tools (formatters etc)
    -- ======================
    local tools = {
      "stylua",
      "tflint",
    }

    if has("node") then
      extend(tools, { "prettier", "eslint_d" })
    end

    if has("python3") then
      extend(tools, { "black", "isort", "pylint" })
    end

    if has("go") then
      extend(tools, { "goimports" })
    end

    if has("rustc") then
      extend(tools, { "rustfmt" })
    end

    mason_tool_installer.setup({
      ensure_installed = tools,
    })
  end,
}
