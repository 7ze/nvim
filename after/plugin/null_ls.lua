local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.djlint,
    },
})

-- disable diagnostics for .env files
local group = vim.api.nvim_create_augroup("__env", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = ".env",
    group = group,
    callback = function(args)
        vim.diagnostic.disable(args.buf)
    end
})
