local cmp = require "cmp"

cmp.setup {
	mapping = {
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		["<C-y>"] = cmp.mapping(
			cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			},
			{ "i", "c" }
		),
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	sources = {
		{ name = "gh_issuews" },
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
	},
	experimental = {
		native_menu = false,
		ghost_test = false,
	}
}

