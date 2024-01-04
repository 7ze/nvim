local Remap = require("zeus.map")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			nnoremap("gD", function()
				vim.lsp.buf.declaration()
			end)
			nnoremap("gd", function()
				vim.lsp.buf.definition()
			end)
			nnoremap("K", function()
				vim.lsp.buf.hover()
			end)
			nnoremap("gI", function()
				vim.lsp.buf.implementation()
			end)
			nnoremap("gr", function()
				vim.lsp.buf.references()
			end)
			nnoremap("gl", function()
				vim.diagnostic.open_float()
			end)
			nnoremap("<leader>lf", function()
				vim.lsp.buf.format({ async = true })
			end)
			nnoremap("<leader>li", "<cmd>LspInfo<cr>")
			nnoremap("<leader>lI", "<cmd>Mason<cr>")
			nnoremap("<leader>la", function()
				vim.lsp.buf.code_action()
			end)
			nnoremap("<leader>lj", function()
				vim.diagnostic.goto_next({ buffer = 0 })
			end)
			nnoremap("<leader>lk", function()
				vim.diagnostic.goto_prev({ buffer = 0 })
			end)
			nnoremap("<leader>lr", function()
				vim.lsp.buf.rename()
			end)
			nnoremap("<leader>ls", function()
				vim.lsp.buf.signature_help()
			end)
			nnoremap("<leader>lq", function()
				vim.diagnostic.setloclist()
			end)
			inoremap("<C-h>", function()
				vim.lsp.buf.signature_help()
			end)
		end,
	}, _config or {})
end

require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require("lspconfig")

local servers = {
	"bashls",
	"clangd",
	"cssls",
	"emmet_ls",
	"gopls",
	"html",
	"jsonls",
	"marksman",
	"pyright",
	"rust_analyzer",
	"tsserver",
	"yamlls",
	"ocamllsp",
	"tailwindcss",
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
