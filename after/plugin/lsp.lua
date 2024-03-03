local Remap = require("zeus.map")
local nnoremap = Remap.nnoremap

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function()
            nnoremap("gD", function()
                vim.lsp.buf.declaration()
            end, { desc = "LSP: Go to declaration" })

            nnoremap("gd", function()
                require("telescope.builtin").lsp_definitions()
            end, { desc = "LSP: Go to definition" })

            nnoremap("gr", function()
                require("telescope.builtin").lsp_references()
            end, { desc = "LSP: Go to references" })

            nnoremap("gI", function()
                require("telescope.builtin").lsp_implementations()
            end, { desc = "LSP: Go to implementations" })

            nnoremap("<leader>D", function()
                require("telescope.builtin").lsp_type_definitions()
            end, { desc = "LSP: Go to type definitions" })

            nnoremap("<leader>ds", function()
                require("telescope.builtin").lsp_document_symbols()
            end, { desc = "LSP: Document symbols" })

            nnoremap("<leader>ws", function()
                require("telescope.builtin").lsp_dynamic_workspace_symbols()
            end, { desc = "LSP: Workspace symbols" })

            nnoremap("<leader>rn", function()
                vim.lsp.buf.rename()
            end, { desc = "LSP: Rename" })

            nnoremap("<leader>ca", function()
                vim.lsp.buf.code_action()
            end, { desc = "LSP: Code action" })

            nnoremap("K", function()
                vim.lsp.buf.hover()
            end, { desc = "LSP: Hover Documentation" })

            nnoremap("<leader>lf", function()
                vim.lsp.buf.format({ async = true })
            end, { desc = "LSP: Format" })

            nnoremap(
                "<leader>li",
                "<cmd>LspInfo<cr>",
                { desc = "LSP: Information about lsp servers attached to the client" }
            )
        end,
    }, _config or {})
end

require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require("lspconfig")

local servers = {
    "ansiblels",
    "bashls",
    "clangd",
    "cssls",
    "dockerls",
    "emmet_ls",
    "gopls",
    "html",
    "htmx",
    "jsonls",
    "marksman",
    "ocamllsp",
    "pyright",
    "ruff_lsp",
    "rust_analyzer",
    "tailwindcss",
    "tsserver",
    "yamlls",
    "zls",
}

for _, server in pairs(servers) do
    lspconfig[server].setup(config())
end

lspconfig.lua_ls.setup(config({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}))

lspconfig.html.setup({
    filetypes = { "html", "htmldjango" },
})
