local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.djlint,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.diagnostics.shellcheck,
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

-- detect ansible filetypes
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "BufEnter" }, {
    group = vim.api.nvim_create_augroup("Ansible", { clear = true }),
    pattern = {
      "*/roles/*/*/*.yaml",
      "*/roles/*/*/.yml",
      "main.yml",
      "main.yaml",
      "local.yml",
      "local.yaml",
      "tasks/*.yaml",
      "tasks/*.yml",
    },
    callback = function()
      vim.opt.filetype = "yaml.ansible"
    end,
  })
