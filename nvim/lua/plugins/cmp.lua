return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"rafamadriz/friendly-snippets",
		{

			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			-- config = function()
			-- 	require("luasnip.loaders.from_vscode").lazy_load({
			-- 		paths = { vim.fn.stdpath("config") .. "/snippets" },
			-- 	})
			-- end,
		},
	},
	config = function()
		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })
		-- local luasnip = require("luasnip")
		cmp.setup.cmdline("/", {
			sources = {
				{ name = "buffer" },
			},
		})
		cmp.setup.cmdline(":", {
			sources = {
				{ name = "cmdline" },
			},
		})
		cmp.setup({
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				-- ["<Cncmd>v
				-- zvzz-b>"] = cmp.mapping.scroll_docs(-4),
				-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-c>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set       `select` to `false` to only confirm explicitly selected items.
			}),

			sources = cmp.config.sources({
				{
					name = "nvim_lsp",
					-- priority = 100,
				},
				{
					name = "path",
					option = {
						pathMappings = {
							["@"] = "${folder}/src",
							["/"] = "${folder}/src/public/",
							["~@"] = "${folder}/src",
							["/images"] = "${folder}/src/images",
							["/components"] = "${folder}/src/components",
						},
					},
				},
				{ name = "buffer" },
				{ name = "luasnip" }, -- For luasnip users.
			}),
		})
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
