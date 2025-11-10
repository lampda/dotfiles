-- lazy.nvim
return {
	"folke/snacks.nvim",
	opts = {
		picker = {},
		explorer = {},
	},
	keys = {
		-- Top Pickers & Explorer
		{
			"<leader>ss",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>b",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		-- find
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>sf",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<C-f>",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		-- search
		{
			'<leader>s"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>s/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},
		{
			"<leader>sa",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "Autocmds",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			"<leader>si",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons",
		},
		{
			"<leader>sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sl",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>sM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>sp",
			function()
				Snacks.picker.lazy()
			end,
			desc = "Search for Plugin Spec",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>se",
			function()
				vim.diagnostic.setqflist()
			end,
			desc = "Resume",
		},
		{
			"<leader><leader>",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
		{
			"<leader>uc",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		-- LSP
		-- {
		-- 	"gd",
		-- 	function()
		-- 		Snacks.picker.lsp_definitions()
		-- 	end,
		-- 	desc = "Goto Definition",
		-- },
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		-- {
		-- 	"<leader>S",
		-- 	function()
		-- 		-- Search for directories and open them in oil
		-- 		local _, oil_dir = pcall(require("oil").get_current_dir)
		-- 		Snacks.picker.pick({
		-- 			title = "Find in directories",
		-- 			format = "file",
		-- 			live = true,
		-- 			cwd = oil_dir,
		-- 			finder = "grep",
		-- 			confirm = function(picker, item)
		-- 				if item == nil then
		-- 					return
		-- 				end
		-- 				picker:close()
		-- 				require("oil").open(oil_dir .. item.file)
		-- 			end,
		-- 		})
		-- 	end,
		-- 	desc = "Directories",
		-- },
		{
			"<leader>\\",
			function()
				-- Search for directories and open them in oil
				local _, oil_dir = pcall(require("oil").get_current_dir)
				Snacks.picker.pick({
					title = "Directories",
					format = "file",
					cwd = oil_dir,
					finder = function(opts, ctx)
						local args = { "--type", "directory", "--color", "never" }
						if opts.hidden then
							table.insert(args, "--hidden")
						end
						if opts.ignored then
							table.insert(args, "--no-ignore")
						end
						local cwd = vim.fs.normalize(opts.cwd or vim.uv.cwd() or ".")
						local proc_opts = {
							cmd = "fd",
							args = args,
							---@param item snacks.picker.finder.Item
							transform = function(item)
								item.cwd = cwd
								item.file = item.text
								item.dir = true
								-- HACK: Pre calcualting _path and setting file to it here, since the directory previewer doesn't handle
								-- cwd correctly currently
								-- https://github.com/folke/snacks.nvim/discussions/2093#discussion-8658159
								item.file = Snacks.picker.util.path(item)
							end,
						}
						return require("snacks.picker.source.proc").proc({ opts, proc_opts }, ctx)
					end,
					confirm = function(picker, item)
						picker:close()
						require("oil").open(item.file)
					end,
				})
			end,
			desc = "Directories",
		},
	},
}
