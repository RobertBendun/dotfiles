local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', '<space>dl', '<cmd>Telescope diagnostic<cr>', opts)

-- This function is executed after language server attaches
-- to the current buffer
local function on_attach(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD',        vim.lsp.buf.declaration,    bufopts)
	vim.keymap.set('n', 'gd',        vim.lsp.buf.definition,     bufopts)
  vim.keymap.set('n', 'K',         vim.lsp.buf.hover,          bufopts)
  vim.keymap.set('n', 'gi',        vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>'    , vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename,         bufopts)
	vim.keymap.set('n', 'gr',        vim.lsp.buf.references,     bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').clangd.setup           { capabilities = capabilities, on_attach = on_attach }
require('lspconfig').pylsp.setup            { capabilities = capabilities, on_attach = on_attach }
require('lspconfig').rust_analyzer.setup    { capabilities = capabilities, on_attach = on_attach }
require('lspconfig').gopls.setup            { capabilities = capabilities, on_attach = on_attach }
require('lspconfig').dhall_lsp_server.setup { capabilities = capabilities, on_attach = on_attach }
require('lspconfig').ruby_ls.setup          { capabilities = capabilities, on_attach = on_attach }
require('lspconfig').tsserver.setup         { capabilities = capabilities, on_attach = on_attach }
-- require('lspconfig').sumneko_lua.setup {
-- 	on_attach = on_attach,
-- 	settings = {
-- 		Lua = {
-- 			diagnostics = { enable = true, globals = {
-- 				"vim", "describe", "it", "before_each", "after_each" },
-- 			},
-- 			workspace = {
-- 				library = {
-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
-- 				}
-- 			}
-- 		}
-- 	}
-- }



