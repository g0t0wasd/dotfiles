require("nvim-lsp-installer").setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local nvim_lsp = require('lspconfig')
-- local navic = require('nvim-navic')
local gps = require('nvim-gps')

local on_attach = function(client, bufnr)
    -- shows current code context
    -- navic.attach(client, bufnr)

    -- Mappings.
    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', '<leader>df', '<cmd>lua vim.diagnostic.goto_next()<cr>', { buffer = 0 })
    vim.keymap.set('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { buffer = 0 })
    vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>', opts)
end

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilites = capabilities,
    filetypes = { "typescript", "javascript", "typescriptreact", "typescript.tsx", "javascriptreact" }
}

-- nvim_lsp.pyright.setup {
--     on_attach = on_attach,
--     filetypes = { "python" }
-- }

nvim_lsp.pylsp.setup {
    on_attach = on_attach,
    filetypes = { "python" }
}

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilites = capabilities,
    filetypes = { "lua" }
}


nvim_lsp.clangd.setup {
    on_attach = on_attach,
    capabilites = capabilities,
    filetypes = { "cpp", "c" }
}
