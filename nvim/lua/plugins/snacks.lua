-- lazy.nvim
-- make a grep that i can pass flags to
-- but idk how much time it would take to do that
-- so instead i will just make a custom grep call that just
-- passes thecurrent buffer ft to the search and things
return {
	"folke/snacks.nvim",
	opts = {
		zen =
			---@class snacks.zen.Config
			{
				-- You can add any `Snacks.toggle` id here.
				-- Toggle state is restored when the window is closed.
				-- Toggle config options are NOT merged.
				---@type table<string, boolean>
				toggles = {
					dim = false,
					git_signs = false,
					mini_diff_signs = false,
					-- diagnostics = false,
					-- inlay_hints = false,
				},
				center = true, -- center the window
				show = {
					statusline = false, -- can only be shown when using the global statusline
					tabline = false,
				},
				---@type snacks.win.Config
				win = {
					style = "zen",
					backdrop = {
						transparent = false,
						blend = 90,
					},
				},
				--- Callback when the window is opened.
				---@param win snacks.win
				on_open = function(win) end,
				--- Callback when the window is closed.
				---@param win snacks.win
				on_close = function(win) end,
				--- Options for the `Snacks.zen.zoom()`
				---@type snacks.zen.Config
				zoom = {
					toggles = {},
					center = true,
					show = { statusline = true, tabline = true },
					win = {
						backdrop = {
							transparent = false,
							blend = 90,
						},
						width = 90, -- full width
					},
				},
			},
		picker = {
			jump = {
				jumplist = true,
				tagstack = false,
				reuse_win = true,
				close = true, -- close the picker when jumping/editing to a location (defaults to true)
				match = true, -- jump to the first match position. (useful for `lines`)
			},
			layout = "owo",
			layouts = {
				owo = {
					layout = {
						box = "vertical",
						backdrop = false,
						row = -1,
						width = 0,
						height = 0.3,
						border = "top",
						title = " {title} {live} {flags}",
						title_pos = "left",
						{
							box = "horizontal",
							{ win = "list", border = "rounded", width = 0.6 },
							{ win = "preview", title = "{preview}", border = "rounded" },
						},
						{ win = "input", height = 1, border = "top" },
					},
				},
			},
			win = {
				input = {
					keys = {
						["<A-h>"] = { { "snacks_files" }, mode = { "n" } },
						["<A-j>"] = { { "snacks_grep" }, mode = { "i", "n" } },
						["<A-k>"] = { { "snacks_buffers" }, mode = { "i", "n" } },
						["<A-l>"] = { { "snacks_files" }, mode = { "i", "n" } },
					},
				},
			},
			actions = {
				---@param p snacks.Picker
				snacks_files = function(p)
					p:close()
					local current = GetSnacksPickerPrompt(p)
					Snacks.picker.files({ pattern = current })
				end,
				---@param p snacks.Picker
				snacks_grep = function(p)
					p:close()
					local current = GetSnacksPickerPrompt(p)
					Snacks.picker.grep({ search = current })
				end,
				---@param p snacks.Picker
				snacks_buffers = function(p)
					p:close()
					local current = GetSnacksPickerPrompt(p)
					Snacks.picker.buffers({ pattern = current })
				end,
				---@param p snacks.Picker
				snacks_smart = function(p)
					p:close()
					local current = GetSnacksPickerPrompt(p)
					Snacks.picker.buffers({ pattern = current })
				end,
			},
		},
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
			"<leader>sg",
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
			"<C-s>",
			function()
				Snacks.picker.resume()
			end,
			desc = "Snacks",
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
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<C-f>",
			function()
				local ext = "." .. vim.fn.expand("%:e")
				Snacks.picker.grep_word({ pattern = ext })
			end,
			desc = "Visual selection or word",
			mode = { "x" },
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
			"<leader>sl",
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
				Snacks.picer.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacs.picker.diagnostics_buffer()
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
			"<leader>sL",
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
				Snacks.picker.resume({ opts = { notify = false } })
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
			"<leader>C",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations({ auto_confirm = true, show_empty = false })
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
			"gt",
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
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
		{
			"<leader>Z",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Toggle Zoom",
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
